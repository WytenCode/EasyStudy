//
//  CourseProgressViewController.m
//  EasyStudy
//
//  Created by Владимир on 14/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseProgressViewController.h"
#import "ProgressView.h"
#import "Constants.h"

@interface CourseProgressViewController ()

@property (nonatomic, strong) ProgressView *myProgressView;

@end

@implementation CourseProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    _myProgressView = [[ProgressView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight)];
    [self setupNavigationTitle];
    [self.view addSubview:_myProgressView];
    
    // Do any additional setup after loading the view.
}

-(void)setupNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Прогресс";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}

@end
