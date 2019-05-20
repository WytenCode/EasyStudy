//
//  DatabaseService.m
//  EasyStudy
//
//  Created by Владимир on 17/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "DatabaseService.h"
#import "Constants.h"

@interface DatabaseService()

@property (nonatomic, strong) FIRDatabaseReference *myGenRef;
@property (nonatomic, strong) FIRDatabaseReference *myUsersRef;
@property (nonatomic, retain) NSMutableArray *loginsArray;
@property (nonatomic, assign) BOOL userCreated;

@end

@implementation DatabaseService

-(FIRDatabaseReference *)getGeneralReference
{
    if (_myGenRef == nil)
        _myGenRef = [[FIRDatabase database] reference];
    return _myGenRef;
}

-(FIRDatabaseReference *)getUsersReference
{
    if (_myUsersRef == nil)
        _myUsersRef = [[[FIRDatabase database] reference] child:@"users"];
    
    return _myUsersRef;
}

-(void)catchUsersLoginsWithMail:(NSString *)newMail password:(NSString *)newPassword login:(NSString *)newLogin
{
    __block NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    [[self getUsersReference] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        if (snapshot == nil)
        {
            [self.myErrorDelegate announceErrorWithText:@"Нет доступа к базе данных"];
        }
        for (FIRDataSnapshot* child in snapshot.children) {
            for (FIRDataSnapshot* childNew in child.children) {
                if ([childNew.key isEqualToString:@"login"])
                [tmpArray addObject:[NSString stringWithFormat:@"%@", childNew.value]];
            }
        }
        if (self.loginsArray == nil)
        self.loginsArray = [[NSMutableArray alloc] initWithArray:tmpArray];
        [self attemptCreateUserWithMail:newMail password:newPassword login:newLogin];
    } withCancelBlock:^(NSError * _Nonnull error) {
        [self.myErrorDelegate announceErrorWithText:error.localizedDescription];
    }];
}

-(void)attemptCreateUserWithMail:(NSString *)newMail password:(NSString *)newPassword login:(NSString *)newLogin
{
    if ([self.loginsArray containsObject:newLogin])
    {
        [self.myErrorDelegate announceErrorWithText:@"Такой никнейм уже используется"];
        self.userCreated = NO;
        return;
    }
    [[FIRAuth auth] createUserWithEmail:newMail password:newPassword completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        
        if (error) {
            [self firebaseErrorInterpretationWithError:error];
            self.userCreated = NO;
            return;
        }
        self.userCreated = YES;
        [self addUserInDatabaseWithMail:newMail password:newPassword login:newLogin nuid:authResult.user.uid];
    }];
}

-(void)addUserInDatabaseWithMail:(NSString *)newMail password:(NSString *)newPassword login:(NSString *)newLogin nuid:(NSString *)newUid
{
    [[[self getUsersReference] child:newUid] setValue:@{@"login": newLogin,
                                                       @"email": newMail,
                                                       @"password": newPassword
                                                       }];
    if (self.userCreated)
        [self.myErrorDelegate announceUserCreated];
}

-(void)firebaseErrorInterpretationWithError:(NSError *)error
{
    if ([[error.userInfo valueForKey:@"FIRAuthErrorUserInfoNameKey"] isEqualToString:@"ERROR_INVALID_EMAIL"])
    {
        [self.myErrorDelegate announceErrorWithText:@"Неправильный формат почты"];
        return;
    }
    if ([[error.userInfo valueForKey:@"FIRAuthErrorUserInfoNameKey"] isEqualToString:@"ERROR_WEAK_PASSWORD"])
    {
        [self.myErrorDelegate announceErrorWithText:@"Слабый пароль(нужно 6 символов и больше)"];
        return;
    }
    if ([[error.userInfo valueForKey:@"FIRAuthErrorUserInfoNameKey"] isEqualToString:@"ERROR_EMAIL_ALREADY_IN_USE"])
    {
        [self.myErrorDelegate announceErrorWithText:@"Эта почта уже используется"];
        return;
    }
    if ([[error.userInfo valueForKey:@"FIRAuthErrorUserInfoNameKey"] isEqualToString:@"ERROR_WRONG_PASSWORD"])
    {
        [self.myErrorDelegate announceErrorWithText:@"Неправильная почта или пароль"];
        return;
    }
    if ([[error.userInfo valueForKey:@"FIRAuthErrorUserInfoNameKey"] isEqualToString:@"ERROR_USER_NOT_FOUND"])
    {
        [self.myErrorDelegate announceErrorWithText:@"Неправильная почта или пароль"];
        return;
    }
}

-(void)releaseSignInWithMail:(NSString *)currentMail password:(NSString *)currentPassword
{
    [[FIRAuth auth] signInWithEmail:currentMail password:currentPassword completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if (error) {
            [self firebaseErrorInterpretationWithError:error];
            return;
        }
        [NSUserDefaults.standardUserDefaults setValue:nil forKey:@"uid"];
        [NSUserDefaults.standardUserDefaults setValue:authResult.user.uid forKey:@"uid"];
        [self.myStartDelegate openAppWithUserID:authResult.user.uid fastStart:NO];
    }];
}

#pragma mark DataServiceDelegate

-(void)tryCreateUserWithLogin:(NSString *)newLogin mail:(NSString *)newMail password:(NSString *)newPassword
{
    self.userCreated = NO;
    [self catchUsersLoginsWithMail:newMail password:newPassword login:newLogin];
}

-(void)trySignInApplicationWithMail:(NSString *)currentMail password:(NSString *)currentPassword
{
    [self releaseSignInWithMail:currentMail password:currentPassword];
}

-(void)tryMakeAutoLogin
{
    if ([NSUserDefaults.standardUserDefaults valueForKey:@"uid"] == nil)
    {
        NSLog(@"Xep");
        return;
    }
    [self.myStartDelegate openAppWithUserID:[NSUserDefaults.standardUserDefaults valueForKey:@"uid"] fastStart:YES];
}

@end
