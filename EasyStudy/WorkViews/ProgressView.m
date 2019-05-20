//
//  ProgressView.m
//  EasyStudy
//
//  Created by Владимир on 14/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic , strong) UITableView *myProgressTableView;

@end


@implementation ProgressView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    [self setupProgressTableView];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

-(void)setupProgressTableView
{
    _myProgressTableView = [[UITableView alloc] initWithFrame:CGRectMake(2, 0, self.frame.size.width - 4, self.frame.size.height) style:UITableViewStylePlain];
    _myProgressTableView.delegate = self;
    _myProgressTableView.dataSource = self;
    
    [_myProgressTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"standart"];
    [self addSubview:_myProgressTableView];
}

#pragma mark TableViewStuff

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"standart" forIndexPath:indexPath];
    newCell.textLabel.text = @"Заметка о прогрессе";
    [newCell setBackgroundColor:[UIColor cyanColor]];
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
