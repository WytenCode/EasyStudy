//
//  CourseCreateViewController.m
//  EasyStudy
//
//  Created by Владимир on 19/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseCreateViewController.h"
#import "CourseCreateView.h"
#import "CourseCreateNameView.h"
#import "CourseCreateDescriptionView.h"
#import "CourseCreateSheduleView.h"
#import "CourseCreateDetailsView.h"
#import "Constants.h"

@interface CourseCreateViewController ()

@property (nonatomic, strong) CourseCreateView *myCreateView;
@property (nonatomic, strong) CourseCreateNameView *myCreateNameView;
@property (nonatomic, strong) CourseCreateDescriptionView *myCreateDescriptionView;
@property (nonatomic, strong) CourseCreateSheduleView *myCreateSheduleView;
@property (nonatomic, strong) CourseCreateDetailsView *myCreateDetailsView;
@property (nonatomic, strong) UIView *currentCustomView;
@property (nonatomic, assign) CGRect standartRect;
@property (nonatomic, retain) NSMutableDictionary *courseData;

@end

@implementation CourseCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.courseData = [NSMutableDictionary new];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    _standartRect = CGRectMake(0, navigationOffset, self.view.frame.size.width, self.view.frame.size.height - navigationOffset - tabBarHeight);
    _myCreateView = [[CourseCreateView alloc] initWithFrame:_standartRect];
    _myCreateView.myCreateDelegate = self;
    [self setupNavigationTitle];
    [self.view addSubview:_myCreateView];
    // Do any additional setup after loading the view.
}

-(void)setupNavigationTitle
{
    UILabel *newLabel = [[UILabel alloc]init];
    newLabel.text = @"Новый курс";
    newLabel.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:newLabel];
    [self.navigationItem.titleView sizeToFit];
    
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithTitle:@"Отмена" style:UIBarButtonItemStylePlain target:self action:@selector(cancelCourseCreation)];
    [createButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f], NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateNormal];
    [self.navigationItem setLeftBarButtonItem:createButton animated:YES];
}

-(void)cancelCourseCreation
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Создание нового курса"
                                                                             message:@"Вы уверены, что хотите выйти из создания курса? Все записанные данные будут потеряны!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *acceptActionButton = [UIAlertAction actionWithTitle:@"Да" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
        [[self navigationController] popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *declineActionButton = [UIAlertAction actionWithTitle:@"Нет" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:acceptActionButton];
    [alertController addAction:declineActionButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)openSomeCreateViewWithView:(UIView *)newView
{
    _currentCustomView = newView;
    [_currentCustomView setHidden:YES];
    [self.view addSubview:_currentCustomView];
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [self.myCreateView setHidden:YES];
        [self.currentCustomView setHidden:NO];
    } completion:nil];
}

#pragma mark CourseCreateDelegate
-(void)openGeneralCreateView
{
    [self.currentCustomView removeFromSuperview];
    self.currentCustomView = nil;
    [self.view addSubview:_myCreateView];
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.myCreateView setHidden:NO];
    } completion:nil];
}

-(void)openGeneralCreateViewWithData:(NSDictionary *)data
{
    [self openGeneralCreateView];
    [self.courseData addEntriesFromDictionary:data];
    NSLog(@"%@", self.courseData);
}

-(void)openCreateNameView
{
    _myCreateNameView  = [[CourseCreateNameView alloc] initWithFrame:_standartRect];
    _myCreateNameView.myCreateDelegate = self;
    [self openSomeCreateViewWithView:_myCreateNameView];
}

-(void)openCreateDescriptionView;
{
    _myCreateDescriptionView  = [[CourseCreateDescriptionView alloc] initWithFrame:_standartRect];
    _myCreateDescriptionView.myCreateDelegate = self;
    [self openSomeCreateViewWithView:_myCreateDescriptionView];
}
-(void)openCreateSheduleView
{
    _myCreateSheduleView  = [[CourseCreateSheduleView alloc] initWithFrame:_standartRect];
    _myCreateSheduleView.myCreateDelegate = self;
    [self openSomeCreateViewWithView:_myCreateSheduleView];
}
-(void)openCreateDetailsView
{
    _myCreateDetailsView  = [[CourseCreateDetailsView alloc] initWithFrame:_standartRect];
    _myCreateDetailsView.myCreateDelegate = self;
    [self openSomeCreateViewWithView:_myCreateDetailsView];
}

@end
