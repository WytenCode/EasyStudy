//
//  CoureCreateMapView.m
//  EasyStudy
//
//  Created by Владимир on 20/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseCreateDetailsView.h"
#import "Constants.h"

@interface CourseCreateDetailsView()

@property (nonatomic, strong) UIButton *goBackButton;

@end

@implementation CourseCreateDetailsView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    [self setBackgroundColor:[UIColor yellowColor]];
    [self prepareCreateNameUI];
    return self;
}

-(void)prepareCreateNameUI
{
    [self setupGoBackButton];
}

-(void)setupGoBackButton
{
    _goBackButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 40, 50, 100)];
    [_goBackButton setBackgroundColor:[UIColor whiteColor]];
    [_goBackButton setTitle:@"Детали" forState:UIControlStateNormal];
    [_goBackButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_goBackButton addTarget:self action:@selector(goBackButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_goBackButton];
}

-(void)goBackButtonPressed
{
    [self.myCreateDelegate openGeneralCreateView];
}

@end
