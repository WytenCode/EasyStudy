//
//  RegisterErrorView.m
//  EasyStudy
//
//  Created by Владимир on 16/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "RegisterErrorView.h"

@interface RegisterErrorView()

@property (nonatomic, strong) UILabel *errorTextLabel;

@end

@implementation RegisterErrorView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    [self setBackgroundColor:[UIColor blackColor]];
    [self prepareErrorLabel];
    return self;
}

-(void)prepareErrorLabel
{
    self.errorTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width - 10, self.frame.size.height)];
    
    [self.errorTextLabel setTextColor:[UIColor redColor]];
    [self.errorTextLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:self.errorTextLabel];
}

-(void)setLabelWithText:(NSString *)text
{
    [self.errorTextLabel setText:[text uppercaseString]];
    self.errorTextLabel.adjustsFontSizeToFitWidth = YES;
}

-(void)setErrorProfileWithText:(NSString *)text
{
    [self setLabelWithText:text];
    [self setBackgroundColor:[UIColor blackColor]];
    [self.errorTextLabel setTextColor:[UIColor redColor]];
}

-(void)setSuccessProfileWithText:(NSString *)text
{
    [self setLabelWithText:text];
    [self setBackgroundColor:[UIColor greenColor]];
    [self.errorTextLabel setTextColor:[UIColor whiteColor]];
}

-(void)makeMove
{
    [UIView animateWithDuration:1 animations:^{
        CGPoint newPoint = CGPointMake(self.center.x, self.center.y - 50);
        self.center = newPoint;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            CGPoint newPoint = CGPointMake(self.center.x, self.center.y - 0.001);
            self.center = newPoint;
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                CGPoint newPoint = CGPointMake(self.center.x, self.center.y + 50.001);
                self.center = newPoint;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }];
    }];
}

@end
