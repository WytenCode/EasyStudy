//
//  CourseViewController.m
//  EasyStudy
//
//  Created by Владимир on 07/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseViewController.h"
#import "CourseView.h"
#import "CourseUsersViewController.h"
#import "CourseSheduleViewController.h"
#import "CourseHomeworkViewController.h"
#import "CourseProgressViewController.h"
#import "Constants.h"

@interface CourseViewController ()

@property (nonatomic, strong) CourseView *myCourseView;

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    _myCourseView = [[CourseView alloc] initWithFrame:CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight)];
    _myCourseView.myCourseDetailDelegate = self;
    [self.view addSubview: _myCourseView];
    // Do any additional setup after loading the view.
}

#pragma mark - Course Delegate

-(void)loadCourseKey:(NSString *)key
{
        UILabel *newLabel = [[UILabel alloc]init];
        newLabel.text = key;
        newLabel.textAlignment = NSTextAlignmentCenter;
        [self.navigationItem setTitleView:newLabel];
        [self.navigationItem.titleView sizeToFit];
}

#pragma mark - CourseDetailDelegate

-(void)openCourseUsersViewControllerWithName:(NSString *)name
{
    CourseUsersViewController *myUsersVC = [CourseUsersViewController new];
    self.usersDelegate = myUsersVC;
    [self.usersDelegate setTopName:name];
    [self.navigationController pushViewController:myUsersVC animated:YES];
}

-(void)openSheduleViewController
{
    CourseSheduleViewController *mySheduleVC = [CourseSheduleViewController new];
    [self.navigationController pushViewController:mySheduleVC animated:YES];
}

-(void)openHomeworkViewController
{
    CourseHomeworkViewController *myHomeworkVC = [CourseHomeworkViewController new];
    [self.navigationController pushViewController:myHomeworkVC animated:YES];
}

-(void)openProgressViewController
{
    CourseProgressViewController *myProgressVC = [CourseProgressViewController new];
    [self.navigationController pushViewController:myProgressVC animated:YES];
}

@end
