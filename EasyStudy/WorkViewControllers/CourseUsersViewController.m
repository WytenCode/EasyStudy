//
//  CourseUsersViewController.m
//  EasyStudy
//
//  Created by Владимир on 11/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseUsersViewController.h"
#import "UsersView.h"
#import "Constants.h"

@interface CourseUsersViewController ()

@property (nonatomic, strong) UsersView *myUsersView;

@end

@implementation CourseUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    _myUsersView = [[UsersView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight)];
    
    [self.view addSubview:_myUsersView];
    
    // Do any additional setup after loading the view.
}

#pragma mark CourseUsersDelegate
-(void)setTopName:(NSString *)name
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = name;
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}

@end
