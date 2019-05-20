//
//  StudyView.m
//  EasyStudy
//
//  Created by Владимир on 04/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "StudyView.h"
#import "CourseTableViewCell.h"
#import "CourseViewController.h"

@interface StudyView()

@property (nonatomic, strong) UISearchBar *studySearchBar;
@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, assign) NSString *cellsId;

@end

@implementation StudyView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.cellsId = @"myCell";
    
    self.backgroundColor = [UIColor orangeColor];
    
    [self configureTableView];
    [self configureSearchController];
    
    return self;
}

-(void)configureTableView
{
    _myTableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    _myTableView.rowHeight = 80.0f;
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    [_myTableView registerClass:[CourseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CourseTableViewCell class])];
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:self.cellsId];
    [self addSubview:_myTableView];
}

-(void)configureSearchController
{
    _studySearchBar = [[UISearchBar alloc] init];
    _studySearchBar.placeholder = @"Введите название курса ...";
    _studySearchBar.delegate = self;
    [_studySearchBar sizeToFit];
    
    _myTableView.tableHeaderView = _studySearchBar;
}

#pragma mark - UISearchBarDelegate

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [_myTableView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [_myTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.studySearchBar resignFirstResponder];
}

#pragma mark - TableView Stuff
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CourseTableViewCell class]) forIndexPath:indexPath];
    [newCell setCourseNameWithName:[NSString stringWithFormat:@"Course #%ld", indexPath.row]];
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CourseTableViewCell *result = [tableView cellForRowAtIndexPath:indexPath];
    [self.studyDelegate openCourseViewControllerWithName:[result getCourseName]];
}


@end
