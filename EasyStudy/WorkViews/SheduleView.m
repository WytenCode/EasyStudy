//
//  SheduleView.m
//  EasyStudy
//
//  Created by Владимир on 12/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "SheduleView.h"
#import "SheduleTableViewCell.h"

@interface SheduleView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, retain) NSMutableArray<NSDate *> *myDates;

@end


@implementation SheduleView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    [self prepareTestDateArray];
    [self setupTableView];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

-(void)prepareTestDateArray
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:20];
    [comps setMonth:5];
    [comps setYear:2019];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
    NSInteger weekSecs = 7 * 24 * 60 * 60;
    NSDate *nextDate;
    _myDates = [NSMutableArray array];
    for (int i = 0; i < 8;i++)
    {
        nextDate = nil;
        nextDate = [[NSDate alloc] initWithTimeInterval:(weekSecs * i) sinceDate:date];
        [self.myDates addObject:nextDate];
    }
}

-(void)setupTableView
{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(2, 0, self.frame.size.width - 4, self.frame.size.height) style:UITableViewStylePlain];
    
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [_myTableView registerClass:[SheduleTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SheduleTableViewCell class])];
    [self addSubview:_myTableView];
}

#pragma mark TableViewStuff

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myDates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SheduleTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SheduleTableViewCell class]) forIndexPath:indexPath];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [newCell setDateWithString:[formatter stringFromDate:[_myDates objectAtIndex:indexPath.row]]];
    [newCell setBackgroundColor:[UIColor yellowColor]];
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
