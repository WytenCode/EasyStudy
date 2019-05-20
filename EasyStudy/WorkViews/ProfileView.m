//
//  ProfileView.m
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "ProfileView.h"
#import "ProfileExpandData.h"
#import "Constants.h"

static const CGFloat labelHeight = 25.0f;

@interface ProfileView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *userIconView;
@property (nonatomic, strong) UILabel *profileFullNameLabel;
@property (nonatomic, strong) UILabel *profileAgeAndJobLabel;
@property (nonatomic, strong) UILabel *profileCompanyLabel;
@property (nonatomic, strong) UILabel *profileLocationLabel;

@property (nonatomic, strong) UITableView *coursesView;
@property (nonatomic, assign) NSString *cellsId;
@property (nonatomic, retain) NSArray *profileHeaders;

@property (nonatomic, retain) NSMutableArray<ProfileExpandData *> *profileData;

@end

@implementation ProfileView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.cellsId = @"myCell";
    ////////////////////////////////////////////////////////////
    self.profileData = [NSMutableArray arrayWithObjects:[[ProfileExpandData alloc] initWithIsExpanded:YES infoStrings:@[@"Course 1", @"Course 2", @"Course 3"]],[[ProfileExpandData alloc] initWithIsExpanded:YES infoStrings:@[@"Course 4", @"Course 5"]], nil];
    ////////////////////////////////////////////////////////////
    self.profileHeaders = [NSArray arrayWithObjects:@"Self description" ,@"Courses ended" , nil];
    [self prepareProfileUI];
    return self;
    // Do any additional setup after loading the view.
}

-(void)prepareProfileUI
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setupUserIconView];
    [self setupProfileFullNameLabel];
    [self setupProfileAgeAndJobLabel];
    [self setupProfileCompanyLabel];
    [self setupProfileLocationLabel];
    [self setupCoursesTableView];
    [self makeConstraints];
}

-(void)setupUserIconView
{
    self.userIconView = [UIView new];
    self.userIconView.backgroundColor = [UIColor orangeColor];
    self.userIconView.layer.cornerRadius = 50;
    self.userIconView.layer.borderWidth = 1.0f;
    self.userIconView.layer.borderColor = [UIColor blackColor].CGColor;
    self.userIconView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.userIconView];
}

-(void)makeConstraints
{
    NSLayoutConstraint *userIconTop = [_userIconView.topAnchor constraintEqualToAnchor:self.topAnchor constant:sideOffset];
    NSLayoutConstraint *userIconLeft = [_userIconView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:sideOffset];
    NSLayoutConstraint *userIconHeight = [_userIconView.heightAnchor constraintEqualToConstant:100.0f];
    NSLayoutConstraint *userIconWidth = [_userIconView.widthAnchor constraintEqualToConstant:100.0f];
    
    NSLayoutConstraint *profileNameTop = [_profileFullNameLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:sideOffset];
    NSLayoutConstraint *profileNameLeft = [_profileFullNameLabel.leftAnchor constraintEqualToAnchor:_userIconView.rightAnchor constant:sideOffset];
    NSLayoutConstraint *profileNameHeight = [_profileFullNameLabel.heightAnchor constraintEqualToConstant:labelHeight];
    NSLayoutConstraint *profileNameRight = [_profileFullNameLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
    
    NSLayoutConstraint *ageJobTop = [_profileAgeAndJobLabel.topAnchor constraintEqualToAnchor:_profileFullNameLabel.bottomAnchor];
    NSLayoutConstraint *ageJobLeft = [_profileAgeAndJobLabel.leftAnchor constraintEqualToAnchor:_userIconView.rightAnchor constant:sideOffset];
    NSLayoutConstraint *ageJobHeight = [_profileAgeAndJobLabel.heightAnchor constraintEqualToConstant:labelHeight];
    NSLayoutConstraint *ageJobRight = [_profileAgeAndJobLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
    
    NSLayoutConstraint *companyTop = [_profileCompanyLabel.topAnchor constraintEqualToAnchor:_profileAgeAndJobLabel.bottomAnchor];
    NSLayoutConstraint *companyLeft = [_profileCompanyLabel.leftAnchor constraintEqualToAnchor:_userIconView.rightAnchor constant:sideOffset];
    NSLayoutConstraint *companyHeight = [_profileCompanyLabel.heightAnchor constraintEqualToConstant:labelHeight];
    NSLayoutConstraint *companyRight = [_profileCompanyLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
    
    NSLayoutConstraint *locationTop = [_profileLocationLabel.topAnchor constraintEqualToAnchor:_profileCompanyLabel.bottomAnchor];
    NSLayoutConstraint *locationLeft = [_profileLocationLabel.leftAnchor constraintEqualToAnchor:_userIconView.rightAnchor constant:sideOffset];
    NSLayoutConstraint *locationHeight = [_profileLocationLabel.heightAnchor constraintEqualToConstant:labelHeight];
    NSLayoutConstraint *locationRight = [_profileLocationLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-sideOffset];
    
    [NSLayoutConstraint activateConstraints:@[userIconTop, userIconLeft, userIconWidth, userIconHeight,
                                              profileNameTop, profileNameLeft, profileNameRight, profileNameHeight,
                                              ageJobTop, ageJobLeft, ageJobRight, ageJobHeight,
                                              companyTop, companyLeft, companyRight, companyHeight,
                                              locationTop, locationLeft, locationRight, locationHeight
                                              ]];
}

-(void)setupProfileFullNameLabel
{
    self.profileFullNameLabel = [UILabel new];
    self.profileFullNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.profileFullNameLabel setTextColor:[UIColor blackColor]];
    [self.profileFullNameLabel setText:@"IVAN \"Batya\" IVANOV"];
    self.profileFullNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.profileFullNameLabel];
}

-(void)setupProfileAgeAndJobLabel
{
    self.profileAgeAndJobLabel = [UILabel new];
    self.profileAgeAndJobLabel.textAlignment = NSTextAlignmentLeft;
    [self.profileAgeAndJobLabel setTextColor:[UIColor blackColor]];
    [self.profileAgeAndJobLabel setText:@"22, iOS Developer"];
    self.profileAgeAndJobLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.profileAgeAndJobLabel];
}

-(void)setupProfileCompanyLabel
{
    self.profileCompanyLabel = [UILabel new];
    self.profileCompanyLabel.textAlignment = NSTextAlignmentLeft;
    [self.profileCompanyLabel setTextColor:[UIColor blackColor]];
    [self.profileCompanyLabel setText:@"Apple"];
    self.profileCompanyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.profileCompanyLabel];
}

-(void)setupProfileLocationLabel
{
    self.profileLocationLabel = [UILabel new];
    self.profileLocationLabel.textAlignment = NSTextAlignmentLeft;
    [self.profileLocationLabel setTextColor:[UIColor blackColor]];
    [self.profileLocationLabel setText:@"Moscow, Russia"];
    self.profileLocationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.profileLocationLabel];
}

-(void)setupCoursesTableView
{
    CGFloat tmpY = labelHeight * 4 + sideOffset * 2;
    self.coursesView = [[UITableView alloc] initWithFrame:CGRectMake(sideOffset, tmpY, self.frame.size.width - 2 * sideOffset, self.frame.size.height - tmpY) style:UITableViewStylePlain];
    self.coursesView.dataSource = self;
    self.coursesView.delegate = self;
    [self.coursesView registerClass:[UITableViewCell class] forCellReuseIdentifier:self.cellsId];
    [self addSubview:self.coursesView];
}

-(void)makeUnderLineWithHeight:(CGFloat)height
{
    UIView *generalUnderLine = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.frame.size.width, 1)];
    generalUnderLine.backgroundColor = [UIColor blackColor];
    [self addSubview:generalUnderLine];
}

#pragma mark UITableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    id obj = [_profileData objectAtIndex:section];
    if ([obj isKindOfClass:[ProfileExpandData class]])
    {
        if (!((ProfileExpandData *)obj).isExpanded)
        {
            return 0;
        }
        return ((ProfileExpandData *)obj).infos.count;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.profileData.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    BOOL currentIsExpanded = YES;
    if ([self.profileData objectAtIndex:section])
    {
        currentIsExpanded = [self.profileData objectAtIndex:section].isExpanded;
    }
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [newButton setTitle:currentIsExpanded ? @"Close" : @"Open" forState:UIControlStateNormal];
    [newButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [newButton setBackgroundColor:[UIColor yellowColor]];
    newButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [newButton addTarget:self action:@selector(handleClosePressed:) forControlEvents:UIControlEventTouchUpInside];
    newButton.tag = section;
    
    return newButton;
}


-(void)handleClosePressed:(UIButton *)button
{
    BOOL currentIsExpanded = [self.profileData objectAtIndex:button.tag].isExpanded;
    [self.profileData objectAtIndex:button.tag].isExpanded = !currentIsExpanded;
    
    NSIndexSet *newSet = [[NSIndexSet alloc]initWithIndex:button.tag];
    [self.coursesView reloadSections:newSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:self.cellsId forIndexPath:indexPath];
    newCell.textLabel.text = [[self.profileData objectAtIndex:indexPath.section].infos objectAtIndex:indexPath.row];
    [newCell setBackgroundColor:[UIColor orangeColor]];
    return newCell;
}

@end
