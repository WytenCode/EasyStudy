//
//  TeachingViewController.m
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "TeachingViewController.h"
#import "CourseCreateViewController.h"
#import "StudyView.h"

static const CGFloat topSpace = 20.0f;

@interface TeachingViewController ()

@property (nonatomic, strong) StudyView *myTeacherView;

@end

@implementation TeachingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    self.myTeacherView = [[StudyView alloc] initWithFrame:CGRectMake(0, topSpace, self.view.frame.size.width, self.view.frame.size.height - topSpace - tabBarHeight)];
    self.myTeacherView.studyDelegate = self;
    [self.view addSubview: self.myTeacherView];
    
    [self setNavigationTitle];
    // Do any additional setup after loading the view.
}

-(void)setNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Преподавание";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
    
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithTitle:@"Создать" style:UIBarButtonItemStylePlain target:self action:@selector(createButtonPushed)];
    [createButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:createButton animated:YES];
}

-(void)createButtonPushed
{
    NSLog(@"Wanna create course");
    CourseCreateViewController *myCreateVC = [CourseCreateViewController new];
    [self.navigationController pushViewController:myCreateVC animated:YES];
}

#pragma mark StudyDelegate
-(void)openCourseViewControllerWithName:(NSString *)name
{
    
}

@end
