//
//  CourseSheduleViewController.m
//  EasyStudy
//
//  Created by Владимир on 12/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseSheduleViewController.h"
#import "SheduleView.h"
#import "Constants.h"

@interface CourseSheduleViewController ()

@property (nonatomic, strong) SheduleView *mySheduleView;

@end

@implementation CourseSheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    _mySheduleView = [[SheduleView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight)];
    [self setupNavigationTitle];
    [self.view addSubview:_mySheduleView];
    
    // Do any additional setup after loading the view.
}

-(void)setupNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Расписание";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}

@end
