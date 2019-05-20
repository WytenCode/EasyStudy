//
//  RegisterViewController.m
//  EasyStudy
//
//  Created by Владимир on 15/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"

static const CGFloat navigationOffset = 64.0f;

@interface RegisterViewController()

@property (nonatomic, strong) RegisterView *myRegisterView;

@end

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _myRegisterView = [[RegisterView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset)];
    [self setupNavigationTitle];
    [self.view addSubview:_myRegisterView];
    
    // Do any additional setup after loading the view.
}

-(void)setupNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Регистрация";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}

@end
