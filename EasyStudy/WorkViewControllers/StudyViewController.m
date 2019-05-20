//
//  StudyViewController.m
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "StudyViewController.h"
#import "StudyView.h"
#import "CourseViewController.h"


static const CGFloat topSpace = 20.0f;


@interface StudyViewController ()

@property (nonatomic, strong) StudyView *myStudyView;

@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    self.myStudyView = [[StudyView alloc] initWithFrame:CGRectMake(0, topSpace, self.view.frame.size.width, self.view.frame.size.height - topSpace - tabBarHeight)];
    self.myStudyView.studyDelegate = self;
    [self.view addSubview: self.myStudyView];
    
    [self setNavigationTitle];
    // Do any additional setup after loading the view.
}

-(void)setNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Обучение";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
}


#pragma mark CourseDelegate

-(void)openCourseViewControllerWithName:(NSString *)name
{
    CourseViewController *existingCourseController = [[CourseViewController alloc] init];
    self.myCourseDelegate = existingCourseController;
    [self.myCourseDelegate loadCourseKey:name];
    [self.navigationController pushViewController:existingCourseController animated:YES];
}


@end
