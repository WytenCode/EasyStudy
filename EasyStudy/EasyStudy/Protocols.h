//
//  Protocols.h
//  EasyStudy
//
//  Created by Владимир on 07/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#ifndef Protocols_h
#define Protocols_h

@protocol StartDelegate <NSObject>
-(void)openAppWithUserID:(NSString *)uid fastStart:(BOOL)fastStart;
-(void)openRegisterForm;
-(void)initCreateUserWithLogin:(NSString *)newLogin mail:(NSString *)newMail password:(NSString *)newPassword;
-(void)initSignInWithMail:(NSString *)currentMail password:(NSString *)currentPassword;
-(void)killRegisterForm;
-(void)changeGrayViewState;
@end

@protocol DataServiceDelegate <NSObject>
-(void)tryCreateUserWithLogin:(NSString *)newLogin mail:(NSString *)newMail password:(NSString *)newPassword;
-(void)trySignInApplicationWithMail:(NSString *)currentMail password:(NSString *)currentPassword;
-(void)tryMakeAutoLogin;
@end

@protocol ErrorDelegate <NSObject>
-(void)announceErrorWithText:(NSString *)text;
-(void)announceSuccessWithText:(NSString *)text;
-(void)announceUserCreated;
@end

@protocol StudyDelegate <NSObject>
-(void)openCourseViewControllerWithName:(NSString *)name;
@end

@protocol CourseDelegate <NSObject>
-(void)loadCourseKey:(NSString *)key;
@end

@protocol CourseDetailDelegate <NSObject>
-(void)openCourseUsersViewControllerWithName:(NSString *)name;
-(void)openSheduleViewController;
-(void)openHomeworkViewController;
-(void)openProgressViewController;
@end

@protocol CourseUsersDelegate <NSObject>
-(void)setTopName:(NSString *)name;
@end

@protocol CreateCourseDelegate <NSObject>
-(void)openGeneralCreateView;
-(void)openCreateNameView;
-(void)openCreateDescriptionView;
-(void)openCreateSheduleView;
-(void)openCreateDetailsView;
-(void)openGeneralCreateViewWithData:(NSDictionary *)data;
@end


#endif /* Protocols_h */
