//
//  RegisterView.m
//  EasyStudy
//
//  Created by Владимир on 15/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView()

@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *loginField;
@property (nonatomic, strong) UILabel *appLabel;

@end

@implementation RegisterView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self prepareStartUI];
    return self;
}

-(void)prepareStartUI
{
    [self setupLoginField];
    [self setupEmailField];
    [self setupPasswordField];
    [self setupRegisterButton];
    
    [self makeConstraints];
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

-(void)setupRegisterButton
{
    _registerButton = [UIButton new];
    [_registerButton setBackgroundColor:[UIColor whiteColor]];
    [_registerButton setTitle:@"Зарегистрироваться" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_registerButton];
    [_registerButton addTarget:self action:@selector(registerButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

-(void)makeConstraints
{
    NSLayoutConstraint *loginTop = [_loginField.topAnchor constraintEqualToAnchor:self.topAnchor constant:20.0f];
    NSLayoutConstraint *loginRight = [_loginField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-30.0f];
    NSLayoutConstraint *loginLeft = [_loginField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:30.0f];
    NSLayoutConstraint *loginHeight = [_loginField.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *emailTop = [_emailField.topAnchor constraintEqualToAnchor:_loginField.bottomAnchor constant:20.0f];
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
    
    [NSLayoutConstraint activateConstraints:@[loginTop, loginLeft, loginRight, loginHeight,
                                              emailTop, emailRight, emailLeft, emailHeight,
                                              passwordTop, passwordRight, passwordLeft, passwordHeight,
                                              registerButtonTop, registerButtonCenter, registerButtonHeight
                                              ]];
}

-(void)registerButtonClicked
{
    NSLog(@"Ну-ну");
}

@end

