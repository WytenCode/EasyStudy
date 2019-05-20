//
//  CourseView.m
//  EasyStudy
//
//  Created by Владимир on 07/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseView.h"
#import "DescriptionTableViewCell.h"

static const CGFloat sideOffset = 5.0f;

@interface CourseView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UILabel *courseName;
@property (nonatomic, strong) UILabel *courseDatePeriod;
@property (nonatomic, strong) UILabel *courseUserStatus;
@property (nonatomic, strong) UITableView *courseTableView;
@property (nonatomic, retain) NSArray<NSString *> * courseTableHeaders;

@end


@implementation CourseView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    _courseTableHeaders = @[@"Описание", @"Преподаватели", @"Студенты", @"Расписание", @"Задания", @"Прогресс"];
    [self prepareCourseUI];
    
    return self;
}


-(void)prepareCourseUI
{
    [self setupCourseName];
    [self setupCourseInfo];
    [self setupCurrentUserStatusInCourse];
    [self makeUnderLineWithHeight:_courseName.frame.origin.y + _courseName.frame.size.height + 22];
    [self makeConstraints];
    [self setupTableView];
    //[_courseTableView sizeToFit];
    
    self.backgroundColor = [UIColor whiteColor];
}

-(void)setupTableView
{
    CGFloat maxHeight = self.frame.size.height - (_courseName.frame.origin.y + _courseName.frame.size.height + 25.0f) ;
    CGRect frame = CGRectMake(sideOffset, _courseName.frame.origin.y + _courseName.frame.size.height + 25.0f, self.frame.size.width - 2*sideOffset, maxHeight);
    _courseTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    _courseTableView.dataSource = self;
    _courseTableView.delegate = self;
    _courseTableView.alwaysBounceVertical = NO;
    
    [_courseTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"standart"];
    [_courseTableView registerClass:[DescriptionTableViewCell class] forCellReuseIdentifier:NSStringFromClass([DescriptionTableViewCell class])];
    
    [self addSubview:_courseTableView];
}

-(void)setupCurrentUserStatusInCourse
{
    _courseUserStatus = [UILabel new];
    
    [_courseUserStatus setFont:[UIFont systemFontOfSize:12]];
    [_courseUserStatus setTextColor:[UIColor blackColor]];
    
    _courseUserStatus.text = @"Вы не участвуете";
    _courseUserStatus.textAlignment = NSTextAlignmentRight;
    _courseUserStatus.backgroundColor = [UIColor grayColor];
    _courseUserStatus.layer.masksToBounds = YES;
    _courseUserStatus.layer.cornerRadius = 3;
    [_courseUserStatus sizeToFit];
    CGFloat tmpX = _courseUserStatus.frame.size.width;
    [_courseUserStatus setFrame:CGRectMake(self.frame.size.width - 2 * sideOffset - tmpX, _courseName.frame.origin.y + _courseName.frame.size.height + 5, tmpX, _courseUserStatus.frame.size.height)];
    
    [self addSubview:_courseUserStatus];
}

-(void)setupCourseInfo
{
    _courseDatePeriod = [[UILabel alloc] init];
    _courseDatePeriod.translatesAutoresizingMaskIntoConstraints = NO;
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    NSDate *today = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDate *tomorrow = [[NSDate alloc] initWithTimeIntervalSinceNow:20000000]; // примерно + 2,5 дня
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    _courseDatePeriod.text = [NSString stringWithFormat:@"%@ - %@", [formatter stringFromDate:today], [formatter stringFromDate:tomorrow]];
    [_courseDatePeriod setFont:[UIFont systemFontOfSize:12]];
    [_courseDatePeriod setTextColor:[UIColor blackColor]];
    
    [self addSubview:_courseDatePeriod];
}

-(void)setupCourseName
{
    _courseName = [[UILabel alloc] initWithFrame:CGRectMake(sideOffset, 0, self.frame.size.width - 2 * sideOffset, 50)];
    _courseName.textAlignment = NSTextAlignmentLeft;
    _courseName.text = @"Школа Сбербанка : Программирование на iOS";
    [_courseName setTextColor:[UIColor blackColor]];
    [_courseName setFont:[UIFont boldSystemFontOfSize:16.0f]];
    _courseName.lineBreakMode = NSLineBreakByWordWrapping;
    _courseName.numberOfLines = [self calculateCourseInfoLines];
    CGRect newFrame = _courseName.frame;
    newFrame.size.height = _courseName.font.lineHeight * [self calculateCourseInfoLines];
    [_courseName setFrame:newFrame];
    [self addSubview:_courseName];
}

-(NSInteger)calculateCourseInfoLines
{
    NSInteger lineCount = 0;
    CGSize constraint = CGSizeMake(_courseName.frame.size.width, CGFLOAT_MAX);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [_courseName.text boundingRectWithSize:constraint
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:_courseName.font}
                                                  context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    long charSize = lroundf(_courseName.font.lineHeight);
    lineCount = size.height/charSize;
    return lineCount;
}

-(void)makeUnderLineWithHeight:(CGFloat)height
{
    UIView *generalUnderLine = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.frame.size.width, 1)];
    generalUnderLine.backgroundColor = [UIColor blackColor];
    [self addSubview:generalUnderLine];
}

-(void)makeConstraints
{
    CGFloat halfWidth = (self.frame.size.width - 2 * sideOffset)/2 - 5.0f;
    
    NSLayoutConstraint *dateTop = [_courseDatePeriod.topAnchor constraintEqualToAnchor:_courseName.bottomAnchor constant:5.0f];
    NSLayoutConstraint *dateLeft = [_courseDatePeriod.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:sideOffset];
    NSLayoutConstraint *dateWidth = [_courseDatePeriod.widthAnchor constraintEqualToConstant:halfWidth];
    NSLayoutConstraint *dateHeigth = [_courseDatePeriod.heightAnchor constraintEqualToConstant:15.0f];
    
//    NSLayoutConstraint *userTop = [_courseUserStatus.topAnchor constraintEqualToAnchor:_courseName.bottomAnchor constant:5.0f];
//    NSLayoutConstraint *userRight = [_courseUserStatus.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
//    NSLayoutConstraint *userWidth = [_courseUserStatus.widthAnchor constraintEqualToConstant:_courseUserStatus.frame.size.width];
//    NSLayoutConstraint *userHeigth = [_courseUserStatus.heightAnchor constraintEqualToConstant:_courseUserStatus.frame.size.height];
    
    [NSLayoutConstraint activateConstraints:@[dateTop, dateLeft, dateWidth, dateHeigth,
                                              //userTop, userRight, userWidth, userHeigth
                                              ]];
}

#pragma mark TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _courseTableHeaders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        DescriptionTableViewCell *myDescriptionCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DescriptionTableViewCell class]) forIndexPath:indexPath];
        [myDescriptionCell setBigTextWithText:@"Данный курс организован компанией Сбербанк для обучения молодых специалистов основам мобильной разработки на iOS."];
        return myDescriptionCell;
    }
    
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"standart" forIndexPath:indexPath];
    newCell.textLabel.text = [_courseTableHeaders objectAtIndex:indexPath.row];
    [newCell setBackgroundColor:[UIColor orangeColor]];
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //_courseTableHeaders = @[@"Описание", @"Преподаватели", @"Студенты", @"Расписание", @"Учебные материалы", @"Задания", @"Прогресс"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if ([[_courseTableHeaders objectAtIndex:indexPath.row] isEqualToString:@"Описание"])
    {
        DescriptionTableViewCell *myDesc = [tableView cellForRowAtIndexPath:indexPath];
        [tableView beginUpdates];
        [myDesc changeText];
        [tableView endUpdates];
        return;
    }
    
    if ([[_courseTableHeaders objectAtIndex:indexPath.row] isEqualToString:@"Преподаватели"])
    {
        [self.myCourseDetailDelegate openCourseUsersViewControllerWithName:@"Преподаватели"];
        return;
    }
    
    if ([[_courseTableHeaders objectAtIndex:indexPath.row] isEqualToString:@"Студенты"])
    {
        [self.myCourseDetailDelegate openCourseUsersViewControllerWithName:@"Студенты"];
        return;
    }
    
    if ([[_courseTableHeaders objectAtIndex:indexPath.row] isEqualToString:@"Расписание"])
    {
        [self.myCourseDetailDelegate openSheduleViewController];
        return;
    }
    
    if ([[_courseTableHeaders objectAtIndex:indexPath.row] isEqualToString:@"Задания"])
    {
        [self.myCourseDetailDelegate openHomeworkViewController];
        return;
    }
    
    if ([[_courseTableHeaders objectAtIndex:indexPath.row] isEqualToString:@"Прогресс"])
    {
        [self.myCourseDetailDelegate openProgressViewController];
        return;
    }
    
}

@end
