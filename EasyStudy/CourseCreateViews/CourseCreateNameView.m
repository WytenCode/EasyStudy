//
//  CourseCreateNameView.m
//  EasyStudy
//
//  Created by Владимир on 20/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseCreateNameView.h"
#import "Constants.h"

@interface CourseCreateNameView()

@property (nonatomic, strong) UILabel *myTopLabel;
@property (nonatomic, strong) UITextView *myTextField;

@property (nonatomic, strong) UIButton *goBackButton;
@property (nonatomic, strong) UIButton *saveInfoButton;

@end

@implementation CourseCreateNameView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    [self setBackgroundColor:[UIColor whiteColor]];
    [self prepareCreateNameUI];
    return self;
}

-(void)prepareCreateNameUI
{
    [self setupGoBackButton];
    [self setupSaveInfoButton];
    [self setupTopLabel];
    [self setupTextField];
    
    [self makeConstraints];
}

-(void)setupTextField
{
    _myTextField = [UITextView new];
    [_myTextField.layer setBorderColor:[UIColor blackColor].CGColor];
    [_myTextField.layer setBorderWidth:1.0f];
    [_myTextField setFont:[UIFont systemFontOfSize:14.0f]];
    _myTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_myTextField];
}

-(void)setupTopLabel
{
    _myTopLabel = [UILabel new];
    [_myTopLabel setText:@"Введите название курса"];
    [_myTopLabel setTextColor:[UIColor blackColor]];
    [_myTopLabel.layer setBorderColor:[UIColor blackColor].CGColor];
    [_myTopLabel.layer setBorderWidth:1.0f];
    [_myTopLabel setTextAlignment:NSTextAlignmentCenter];
    _myTopLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_myTopLabel];
}

-(void)setupGoBackButton
{
    _goBackButton = [UIButton new];
    [_goBackButton setBackgroundColor:[UIColor whiteColor]];
    [_goBackButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [_goBackButton.layer setBorderWidth:1.0f];
    [_goBackButton setTitle:@"Отмена" forState:UIControlStateNormal];
    [_goBackButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_goBackButton addTarget:self action:@selector(goBackButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    _goBackButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_goBackButton];
}

-(void)setupSaveInfoButton
{
    _saveInfoButton = [UIButton new];
    [_saveInfoButton setBackgroundColor:[UIColor whiteColor]];
    [_saveInfoButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [_saveInfoButton.layer setBorderWidth:1.0f];
    [_saveInfoButton setTitle:@"Сохранить" forState:UIControlStateNormal];
    [_saveInfoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_saveInfoButton addTarget:self action:@selector(saveInfoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    _saveInfoButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_saveInfoButton];
}

-(void)makeConstraints
{
    CGFloat tmpWidth = (self.frame.size.width - (3 * sideOffset))/2;
    NSLayoutConstraint *goBackBottom = [_goBackButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-sideOffset];
    NSLayoutConstraint *goBackRight = [_goBackButton.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
    NSLayoutConstraint *goBackHeight = [_goBackButton.heightAnchor constraintEqualToConstant:40.0f];
    NSLayoutConstraint *goBackWidth = [_goBackButton.widthAnchor constraintEqualToConstant:tmpWidth];
    
    NSLayoutConstraint *saveInfoBottom = [_saveInfoButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-sideOffset];
    NSLayoutConstraint *saveInfoLeft = [_saveInfoButton.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:sideOffset];
    NSLayoutConstraint *saveInfoHeight = [_saveInfoButton.heightAnchor constraintEqualToConstant:40.0f];
    NSLayoutConstraint *saveInfoWidth = [_saveInfoButton.widthAnchor constraintEqualToConstant:tmpWidth];
    
    NSLayoutConstraint *topLabelTop = [_myTopLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:0];
    NSLayoutConstraint *topLabelLeft = [_myTopLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0];
    NSLayoutConstraint *topLabelRight = [_myTopLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0];
    NSLayoutConstraint *topLabelHeight = [_myTopLabel.heightAnchor constraintEqualToConstant:40.0f];
    
    NSLayoutConstraint *textFieldTop = [_myTextField.topAnchor constraintEqualToAnchor:_myTopLabel.bottomAnchor constant:2.0f];
    NSLayoutConstraint *textFieldLeft = [_myTextField.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:sideOffset];
    NSLayoutConstraint *textFieldRight = [_myTextField.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
    NSLayoutConstraint *textFieldHeight = [_myTextField.heightAnchor constraintEqualToConstant:85.0f];
    
    [NSLayoutConstraint activateConstraints:@[goBackRight, goBackWidth, goBackBottom, goBackHeight,
                                              saveInfoLeft, saveInfoWidth, saveInfoBottom, saveInfoHeight,
                                              topLabelTop, topLabelLeft, topLabelRight, topLabelHeight,
                                              textFieldTop, textFieldLeft, textFieldRight, textFieldHeight
                                              ]];
}

-(void)goBackButtonPressed
{
    [self.myCreateDelegate openGeneralCreateView];
}

-(void)saveInfoButtonPressed
{
    NSDictionary *data = [NSDictionary dictionaryWithObject:_myTextField.text forKey:@"courseName"];
    [self.myCreateDelegate openGeneralCreateViewWithData:data];
}

@end
