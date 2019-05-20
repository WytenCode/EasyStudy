//
//  UsersView.m
//  EasyStudy
//
//  Created by Владимир on 12/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "UsersView.h"
#import "UsersTableViewCell.h"

@interface UsersView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic , strong) UITableView *myTableView;

@end

@implementation UsersView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    [self setupTableView];
    
    return self;
}

-(void)setupTableView
{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(2, 0, self.frame.size.width - 4, self.frame.size.height) style:UITableViewStylePlain];
    
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [_myTableView registerClass:[UsersTableViewCell class] forCellReuseIdentifier:NSStringFromClass([UsersTableViewCell class])];
    [self addSubview:_myTableView];
    
    [_myTableView sizeToFit];
    if (_myTableView.frame.size.height < self.frame.size.height)
        self.myTableView.scrollEnabled = NO;
    else
        self.myTableView.scrollEnabled = YES;
}

#pragma mark TableViewStuff

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UsersTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UsersTableViewCell class]) forIndexPath:indexPath];
    newCell.textLabel.text = @"Cын маминой подруги";
    [newCell setBackgroundColor:[UIColor cyanColor]];
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
