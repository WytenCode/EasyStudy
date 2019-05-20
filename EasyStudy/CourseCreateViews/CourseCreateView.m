//
//  CourseCreateView.m
//  EasyStudy
//
//  Created by Владимир on 19/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseCreateView.h"
#import "CourseCreateCell.h"
#import "Constants.h"

@interface CourseCreateView() <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCreationView;
@property (nonatomic ,assign) NSArray *createCourseHeaders;

@end

@implementation CourseCreateView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
    return nil;

    _createCourseHeaders = [NSArray arrayWithObjects:@"Название", @"Описание", @"Расписание",
                            @"Детали", nil];
    
    [self prepareCreateNameUI];
    [self setBackgroundColor:[UIColor whiteColor]];
    return self;
}

-(void)prepareCreateNameUI
{
    [self setupCreationCollectionView];
}

-(void)setupCreationCollectionView
{
    UICollectionViewFlowLayout *myLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat tmpHeight = self.frame.size.height - 2 * sideOffset;
    CGFloat tmpWidth = self.frame.size.width - 2 * sideOffset - 10;
    int tmpRound = floor(tmpWidth / 2);
    NSUInteger someTmp = (_createCourseHeaders.count / 2) + (_createCourseHeaders.count % 2 == 0 ? 0 : 1);
    tmpHeight = tmpHeight - ((someTmp - 1) * 10);
    int tmpInt = floor(tmpHeight / someTmp);
    [myLayout setItemSize:CGSizeMake(tmpRound, tmpInt)];
    [myLayout setMinimumLineSpacing:10];
    [myLayout setMinimumInteritemSpacing:10];
    _myCreationView = [[UICollectionView alloc] initWithFrame:CGRectMake(sideOffset, sideOffset, tmpWidth + 10, tmpHeight) collectionViewLayout:myLayout];
    [_myCreationView setBackgroundColor:[UIColor whiteColor]];
    [_myCreationView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"standart"];
    [_myCreationView registerClass:[CourseCreateCell class] forCellWithReuseIdentifier:NSStringFromClass([CourseCreateCell class])];
    _myCreationView.delegate = self;
    _myCreationView.dataSource = self;
    [self addSubview:_myCreationView];
}

#pragma mark CollectionView Stuff
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.createCourseHeaders.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CourseCreateCell *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CourseCreateCell class]) forIndexPath:indexPath];
    [newCell prepareTextLabelWithText:[self.createCourseHeaders objectAtIndex:indexPath.row]];
    return newCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CourseCreateCell *tmpCell = (CourseCreateCell *)[_myCreationView cellForItemAtIndexPath:indexPath];
    NSString *tmpStr = [tmpCell giveTitle];
    if ([tmpStr isEqualToString:@"Название"])
    {
        NSLog(@"Введите название курса");
        [self.myCreateDelegate openCreateNameView];
        return;
    }
    if ([tmpStr isEqualToString:@"Описание"])
    {
        NSLog(@"Введите описание курса");
        [self.myCreateDelegate openCreateDescriptionView];
        return;
    }
    if ([tmpStr isEqualToString:@"Расписание"])
    {
        NSLog(@"Заполните расписание курса");
        [self.myCreateDelegate openCreateSheduleView];
        return;
    }
    if ([tmpStr isEqualToString:@"Детали"])
    {
        NSLog(@"Заполните детали курса");
        [self.myCreateDelegate openCreateDetailsView];
        return;
    }
}

@end
