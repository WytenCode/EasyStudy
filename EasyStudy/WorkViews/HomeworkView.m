//
//  HomeworkView.m
//  EasyStudy
//
//  Created by Владимир on 14/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "HomeworkView.h"

@interface HomeworkView()

@property (nonatomic, strong) UICollectionView *homeworkCollectionView;

@end

@implementation HomeworkView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    [self setupHomeworkCollectionView];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

-(void)setupHomeworkCollectionView
{
    //_homeworkCollectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:UICollectionViewFlowLayout];
    UICollectionViewFlowLayout *myLayout = [UICollectionViewFlowLayout new];
    [myLayout setItemSize:CGSizeMake(100, 100)];
    [myLayout setMinimumLineSpacing:10];
    _homeworkCollectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:myLayout];
    [_homeworkCollectionView setBackgroundColor:[UIColor yellowColor]];
    
    [self addSubview:_homeworkCollectionView];
}

@end
