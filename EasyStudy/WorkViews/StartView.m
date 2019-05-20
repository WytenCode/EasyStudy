//
//  StartView.m
//  EasyStudy
//
//  Created by Владимир on 15/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "StartView.h"
#import "RegisterErrorView.h"
#import "DatabaseService.h"
@import FirebaseAuth;

@interface StartView()

@property (nonatomic, strong) UIButton *enterAppButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *cancelRegistrationButton;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UILabel *appLabel;
@property (nonatomic, strong) UITextField *loginField;
@property (nonatomic, strong) RegisterErrorView *alertView;

@end

@implementation StartView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    [self setBackgroundColor:[UIColor whiteColor]];
    return self;
}

-(void)giveEnterForm
{
    [self prepareStartUI];
}

-(void)giveRegisterForm
{
    [self prepareRegisterUI];
}

-(void)prepareStartUI
{
    [self setupAppLabel];
    [self setupEmailField];
    [self setupPasswordField];
    [self setupEnterAppButton];
    [self setupRegisterButtonWithCase:1];
    
    [self makeConstraints_1];
    [self testEnter];
}

-(void)testEnter
{
    [self.emailField setText:@"Vova@gmail.com"];
    [self.passwordField setText:@"Vova@vovavova"];
}

-(void)prepareRegisterUI
{
    [self setupAppLabel];
    [self setupLoginField];
    [self setupEmailField];
    [self setupPasswordField];
    [self setupRegisterButtonWithCase:2];
    [self setupCancelRegistrationButton];
    
    [self makeConstraints_2];
}

-(void)setupAppLabel
{
    _appLabel = [UILabel new];
    [_appLabel setText:@"EasyStudy"];
    [_appLabel setFont:[UIFont systemFontOfSize:20.0f]];
    [_appLabel setTextColor:[UIColor blackColor]];
    
    _appLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_appLabel];
}

-(void)setupPasswordField
{
    _passwordField = [UITextField new];
    _passwordField.textAlignment = NSTextAlignmentLeft;
    [_passwordField setPlaceholder:@"Введите пароль ..."];
    _passwordField.layer.borderColor = [UIColor blackColor].CGColor;
    _passwordField.layer.borderWidth = 1.0f;
    [_passwordField setSecureTextEntry:YES];
    _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_passwordField];
}

-(void)setupEmailField
{
    _emailField = [UITextField new];
    _emailField.textAlignment = NSTextAlignmentLeft;
    [_emailField setPlaceholder:@"Введите почту ..."];
    _emailField.layer.borderColor = [UIColor blackColor].CGColor;
    _emailField.layer.borderWidth = 1.0f;
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_emailField];
}

-(void)setupLoginField
{
    _loginField = [UITextField new];
    _loginField.textAlignment = NSTextAlignmentLeft;
    [_loginField setPlaceholder:@"Введите никнейм ..."];
    _loginField.layer.borderColor = [UIColor blackColor].CGColor;
    _loginField.layer.borderWidth = 1.0f;
    _loginField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_loginField];
}

-(void)setupEnterAppButton
{
    _enterAppButton = [UIButton new];
    _enterAppButton.backgroundColor = [UIColor whiteColor];
    [_enterAppButton setTitle:@"Войти в приложение" forState:UIControlStateNormal];
    [_enterAppButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _enterAppButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_enterAppButton];
    [_enterAppButton addTarget:self action:@selector(startButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setupCancelRegistrationButton
{
    _cancelRegistrationButton = [UIButton new];
    _cancelRegistrationButton.backgroundColor = [UIColor whiteColor];
    [_cancelRegistrationButton setTitle:@"Отмена" forState:UIControlStateNormal];
    [_cancelRegistrationButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _cancelRegistrationButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_cancelRegistrationButton];
    [_cancelRegistrationButton addTarget:self action:@selector(cancelRegistrationButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setupRegisterButtonWithCase:(NSInteger)curCase
{
    _registerButton = [UIButton new];
    [_registerButton setBackgroundColor:[UIColor whiteColor]];
    [_registerButton setTitle:@"Зарегистрироваться" forState:UIControlStateNormal];
    if (curCase == 1)
    {
        [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(registerButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [_registerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(registrationCompleted) forControlEvents:UIControlEventTouchUpInside];
    }
    _registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_registerButton];
}

-(void)makeConstraints_1
{
    NSLayoutConstraint *appLabelTop = [_appLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:60.0f];
    NSLayoutConstraint *appLabelCenter = [_appLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *appLabelHeight = [_appLabel.heightAnchor constraintEqualToConstant:50.0f];
    
    NSLayoutConstraint *emailTop = [_emailField.topAnchor constraintEqualToAnchor:_appLabel.bottomAnchor constant:20.0f];
    NSLayoutConstraint *emailRight = [_emailField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-30.0f];
    NSLayoutConstraint *emailLeft = [_emailField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30.0f];
    NSLayoutConstraint *emailHeight = [_emailField.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *passwordTop = [_passwordField.topAnchor constraintEqualToAnchor:_emailField.bottomAnchor constant:10.0f];
    NSLayoutConstraint *passwordRight = [_passwordField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-30.0f];
    NSLayoutConstraint *passwordLeft = [_passwordField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30.0f];
    NSLayoutConstraint *passwordHeight = [_passwordField.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *enterButtonTop = [_enterAppButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:10.0f];
    NSLayoutConstraint *enterButtonHeight = [_enterAppButton.heightAnchor constraintEqualToConstant:30.0f];
    NSLayoutConstraint *enterButtonCenter = [_enterAppButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    
    NSLayoutConstraint *registerButtonTop = [_registerButton.topAnchor constraintEqualToAnchor:_enterAppButton.bottomAnchor constant:5.0f];
    NSLayoutConstraint *registerButtonHeight = [_registerButton.heightAnchor constraintEqualToConstant:30.0f];
    NSLayoutConstraint *registerButtonCenter = [_registerButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    
    [NSLayoutConstraint activateConstraints:@[appLabelTop, appLabelCenter, appLabelHeight,
                                              emailTop, emailRight, emailLeft, emailHeight,
                                              passwordTop, passwordRight, passwordLeft, passwordHeight,
                                              enterButtonTop, enterButtonCenter, enterButtonHeight,
                                              registerButtonTop, registerButtonCenter, registerButtonHeight
                                              ]];
}

-(void)makeConstraints_2
{
    NSLayoutConstraint *appLabelTop = [_appLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:60.0f];
    NSLayoutConstraint *appLabelCenter = [_appLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *appLabelHeight = [_appLabel.heightAnchor constraintEqualToConstant:50.0f];
    
    NSLayoutConstraint *loginTop = [_loginField.topAnchor constraintEqualToAnchor:_appLabel.bottomAnchor constant:20.0f];
    NSLayoutConstraint *loginRight = [_loginField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-30.0f];
    NSLayoutConstraint *loginLeft = [_loginField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30.0f];
    NSLayoutConstraint *loginHeight = [_loginField.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *emailTop = [_emailField.topAnchor constraintEqualToAnchor:_loginField.bottomAnchor constant:10.0f];
    NSLayoutConstraint *emailRight = [_emailField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-30.0f];
    NSLayoutConstraint *emailLeft = [_emailField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30.0f];
    NSLayoutConstraint *emailHeight = [_emailField.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *passwordTop = [_passwordField.topAnchor constraintEqualToAnchor:_emailField.bottomAnchor constant:10.0f];
    NSLayoutConstraint *passwordRight = [_passwordField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-30.0f];
    NSLayoutConstraint *passwordLeft = [_passwordField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30.0f];
    NSLayoutConstraint *passwordHeight = [_passwordField.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *registerButtonTop = [_registerButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:5.0f];
    NSLayoutConstraint *registerButtonHeight = [_registerButton.heightAnchor constraintEqualToConstant:30.0f];
    NSLayoutConstraint *registerButtonCenter = [_registerButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    
    NSLayoutConstraint *cancelButtonTop = [_cancelRegistrationButton.topAnchor constraintEqualToAnchor:_registerButton.bottomAnchor constant:5.0f];
    NSLayoutConstraint *cancelButtonHeight = [_cancelRegistrationButton.heightAnchor constraintEqualToConstant:30.0f];
    NSLayoutConstraint *cancelButtonCenter = [_cancelRegistrationButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    
    [NSLayoutConstraint activateConstraints:@[appLabelTop, appLabelCenter, appLabelHeight,
                                              loginTop, loginLeft, loginRight, loginHeight,
                                              emailTop, emailRight, emailLeft, emailHeight,
                                              passwordTop, passwordRight, passwordLeft, passwordHeight,
                                              registerButtonTop, registerButtonCenter, registerButtonHeight,
                                              cancelButtonTop, cancelButtonCenter, cancelButtonHeight
                                              ]];
}

-(void)startButtonClicked
{
    NSString *newUserMail = _emailField.text;
    NSString *newUserPassword = _passwordField.text;
    
    if ([newUserMail isEqualToString:@""])
    {
        [self announceErrorWithText:@"пустая почта"];
        return;
    }
    if ([newUserPassword isEqualToString:@""])
    {
        [self announceErrorWithText:@"пустой пароль"];
        return;
    }
    [self.startDelegate initSignInWithMail:newUserMail password:newUserPassword];
}

-(void)registerButtonClicked
{
    [self.startDelegate openRegisterForm];
}

-(void)cancelRegistrationButtonPressed
{
    [self.startDelegate killRegisterForm];
}

-(void)registrationCompleted
{
    NSString *newUserName = _loginField.text;
    NSString *newUserMail = _emailField.text;
    NSString *newUserPassword = _passwordField.text;
    if ([newUserName isEqualToString:@""])
    {
        [self announceErrorWithText:@"пустой никнейм"];
        return;
    }
    if ([newUserMail isEqualToString:@""])
    {
        [self announceErrorWithText:@"пустая почта"];
        return;
    }
    if ([newUserPassword isEqualToString:@""])
    {
        [self announceErrorWithText:@"пустой пароль"];
        return;
    }
    [self.startDelegate initCreateUserWithLogin:newUserName mail:newUserMail password:newUserPassword];
}

#pragma mark ErrorDelegate
-(void)announceErrorWithText:(NSString *)text
{
    if (_alertView != nil)
    {
        [_alertView removeFromSuperview];
        _alertView = nil;
    }
    _alertView = [[RegisterErrorView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 50)];
    
    [_alertView setErrorProfileWithText:text];
    [self addSubview:_alertView];
    [_alertView makeMove];
}

-(void)announceSuccessWithText:(NSString *)text
{
    if (_alertView != nil)
    {
        [_alertView removeFromSuperview];
        _alertView = nil;
    }
    _alertView = [[RegisterErrorView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 50)];
    
    [_alertView setSuccessProfileWithText:text];
    [self addSubview:_alertView];
    [_alertView makeMove];
}

-(void)announceUserCreated
{
    NSLog(@"Relax");
}

@end
