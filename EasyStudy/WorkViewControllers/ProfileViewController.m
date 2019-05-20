//
//  ProfileViewController.m
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileView.h"
#import "Constants.h"

@interface ProfileViewController ()

@property (nonatomic, strong) ProfileView *myProfileView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    self.myProfileView = [[ProfileView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight)];
    [self.view addSubview:self.myProfileView];
    
    [self setNavigationTitle];
    // Do any additional setup after loading the view.
}

-(void)setNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Ваш профиль";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}

@end
