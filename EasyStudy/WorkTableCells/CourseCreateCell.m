//
//  CourseCreateCell.m
//  EasyStudy
//
//  Created by Владимир on 20/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseCreateCell.h"
#import "Constants.h"


@interface CourseCreateCell()

@property (nonatomic, strong) UILabel *myLabel;

@end


@implementation CourseCreateCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    [self setBackgroundColor:[UIColor darkGrayColor]];
    return self;
}

-(void)prepareTextLabelWithText:(NSString *)text
{
    _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(sideOffset, sideOffset, self.frame.size.width - 2*sideOffset, self.frame.size.height - 2*sideOffset)];
    [_myLabel setText:text];
    [_myLabel setTextColor:[UIColor whiteColor]];
    [_myLabel setTextAlignment:NSTextAlignmentCenter];
                
    [self addSubview:_myLabel];
}

-(NSString *)giveTitle
{
    return _myLabel.text;
}

@end
