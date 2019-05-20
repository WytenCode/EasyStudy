//
//  ViewController.m
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "ViewController.h"
#import "ProfileViewController.h"
#import "StudyViewController.h"
#import "TeachingViewController.h"
#import "SearchViewController.h"
#import "DatabaseService.h"
#import "StartView.h"

@interface ViewController () <StartDelegate>

@property (nonatomic, strong) StartView *myStartView;
@property (nonatomic, strong) StartView *myRegisterForm;
@property (nonatomic, strong) DatabaseService *myService;
@property (nonatomic, strong) UIView *grayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGreyView];
    _myStartView = [[StartView alloc] initWithFrame:self.view.frame];
    _myStartView.startDelegate = self;
    [self.view addSubview:_myStartView];
    [_myStartView giveEnterForm];
    [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(tryAutoLogin) userInfo:nil repeats:NO];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tryAutoLogin
{
    [self initDatabaseService];
    [self.dataDelegate tryMakeAutoLogin];
}

-(void)initGreyView
{
    if (_grayView != nil)
        return;
    _grayView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _grayView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
}

#pragma mark StartDelegate

-(void)openAppWithUserID:(NSString *)uid fastStart:(BOOL)fastStart
{
    UIView *grayView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    grayView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [self.view addSubview:grayView];
    
    UINavigationController *profileVC = [[UINavigationController alloc] initWithRootViewController:[[ProfileViewController alloc] init]];
    profileVC.tabBarItem.title = @"Профиль";
    profileVC.tabBarItem.image = [UIImage imageNamed:@"UserProfileIcon"];
    
    UINavigationController *navStudy = [[UINavigationController alloc] initWithRootViewController:[[StudyViewController alloc] init]];
    navStudy.tabBarItem.title = @"Учёба";
    navStudy.tabBarItem.image = [UIImage imageNamed:@"StudyIcon"];
    
    UINavigationController *teachingVC = [[UINavigationController alloc] initWithRootViewController:[[TeachingViewController alloc] init]];
    teachingVC.tabBarItem.title = @"Преподавание";
    teachingVC.tabBarItem.image = [UIImage imageNamed:@"TeachIcon"];
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    searchVC.tabBarItem.title = @"Поиск";
    searchVC.tabBarItem.image = [UIImage imageNamed:@"SearchIcon"];
    
    NSArray *newControllers = @[profileVC, navStudy, teachingVC, searchVC];
    
    if (!fastStart)
    {
        [UIView transitionFromView:self.view toView:profileVC.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
            [self.tabBarController.tabBar setHidden:NO];
            self.tabBarController.viewControllers = newControllers;
        }];
        return;
    }

    NSLog(@"fast start");
    [self.tabBarController.tabBar setHidden:NO];
    self.tabBarController.viewControllers = newControllers;
    return;
}

-(void)changeGrayViewState
{
    if(![self.grayView isDescendantOfView:self.view]) {
        [self.view addSubview:self.grayView];
    } else {
        [self.grayView removeFromSuperview];
    }
}

-(void)openRegisterForm
{
    _myRegisterForm = [[StartView alloc] initWithFrame:self.view.frame];
    _myRegisterForm.startDelegate = self;
    [_myRegisterForm setHidden:YES];
    [self.view addSubview:_myRegisterForm];
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        [self.myRegisterForm setHidden:NO];
        [self.myStartView setHidden:YES];
    } completion:nil];
    
    [_myRegisterForm giveRegisterForm];
}

-(void)killRegisterForm
{
    if (_myRegisterForm != nil)
    {
        [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
            [self.myRegisterForm setHidden:YES];
            [self.myStartView setHidden:NO];
        } completion:nil];
        [_myRegisterForm removeFromSuperview];
        _myRegisterForm = nil;
        [self.view addSubview:_myStartView];
    }
}

-(void)initDatabaseService
{
    if (_myService != nil)
        return;
    _myService = [DatabaseService new];
    _myService.myErrorDelegate = self;
    _myService.myStartDelegate = self;
    self.dataDelegate = _myService;
}

-(void)initCreateUserWithLogin:(NSString *)newLogin mail:(NSString *)newMail password:(NSString *)newPassword
{
    [self changeGrayViewState];
    [self initDatabaseService];
    [self.dataDelegate tryCreateUserWithLogin:newLogin mail:newMail password:newPassword];
}

-(void)initSignInWithMail:(NSString *)currentMail password:(NSString *)currentPassword
{
    [self changeGrayViewState];
    [self initDatabaseService];
    [self.dataDelegate trySignInApplicationWithMail:currentMail password:currentPassword];
}

#pragma mark ErrorDelegate
-(void)announceErrorWithText:(NSString *)text
{
    [self changeGrayViewState];
    if (_myRegisterForm != nil)
    {
        self.myErrorDelegate = _myRegisterForm;
    }
    else
        self.myErrorDelegate = _myStartView;
    [self.myErrorDelegate announceErrorWithText:text];
}

-(void)announceSuccessWithText:(NSString *)text
{
    [self changeGrayViewState];
    if (_myRegisterForm != nil)
    {
        self.myErrorDelegate = _myRegisterForm;
    }
    else
        self.myErrorDelegate = _myStartView;
    [self.myErrorDelegate announceSuccessWithText:text];
}

-(void)announceUserCreated
{
    [self changeGrayViewState];
    [self killRegisterForm];
    [self announceSuccessWithText:@"Учётная запись успешно создана!"];
}


@end
