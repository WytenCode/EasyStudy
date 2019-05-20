//
//  CourseHomeworkViewController.m
//  EasyStudy
//
//  Created by Владимир on 14/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseHomeworkViewController.h"
#import "HomeworkView.h"
#import "Constants.h"

@interface CourseHomeworkViewController ()

@property (nonatomic, strong) HomeworkView *myHomeworkView;

@end

@implementation CourseHomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    _myHomeworkView = [[HomeworkView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight)];
    [self setupNavigationTitle];
    [self.view addSubview:_myHomeworkView];
    
    // Do any additional setup after loading the view.
}

-(void)setupNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Задания";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}

@end
