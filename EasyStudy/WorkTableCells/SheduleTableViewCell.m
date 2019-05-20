//
//  SheduleTableViewCell.m
//  EasyStudy
//
//  Created by Владимир on 12/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "SheduleTableViewCell.h"

static const CGFloat cellBoundsOffset = 5.0f;
static const CGFloat cellHeight = 80.0f;

@interface SheduleTableViewCell()

@property (nonatomic, strong) UILabel *lessonName;
@property (nonatomic, strong) UILabel *lessonDate;
@property (nonatomic, strong) UILabel *lessonTeacher;

@end

@implementation SheduleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self)
        return nil;
    
    self.backgroundColor = [UIColor whiteColor];
    
    _lessonName = [UILabel new];
    _lessonName.textAlignment = NSTextAlignmentLeft;
    [_lessonName setFont:[UIFont boldSystemFontOfSize:16.0f]];
    _lessonName.text = @"Новая тема";
    _lessonName.translatesAutoresizingMaskIntoConstraints = NO;
    
    _lessonDate = [UILabel new];
    _lessonDate.textAlignment = NSTextAlignmentLeft;
    [_lessonDate setFont:[UIFont systemFontOfSize:14.0f]];
    _lessonDate.text = @"Februadry 23rd";
    _lessonDate.translatesAutoresizingMaskIntoConstraints = NO;
    
    _lessonTeacher = [UILabel new];
    _lessonTeacher.textAlignment = NSTextAlignmentRight;
    [_lessonTeacher setFont:[UIFont systemFontOfSize:14.0f]];
    _lessonTeacher.text = @"Ведёт";
    _lessonTeacher.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:_lessonName];
    [self.contentView addSubview:_lessonDate];
    [self.contentView addSubview:_lessonTeacher];
    
    [self makeConstraints];
    
    return self;
}

-(void)makeConstraints
{
    CGFloat rowHeight = (cellHeight - 2 * cellBoundsOffset)/2;
    CGFloat halfWidth = (self.frame.size.width - 3 * cellBoundsOffset)/2;
    
    NSLayoutConstraint *nameTop = [_lessonName.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *nameLeft = [_lessonName.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *nameRight = [_lessonName.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *nameHight = [_lessonName.heightAnchor constraintEqualToConstant:rowHeight];
    
    NSLayoutConstraint *dataTop = [_lessonDate.topAnchor constraintEqualToAnchor:_lessonName.bottomAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *dataLeft = [_lessonDate.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *dataBottom = [_lessonDate.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *dataWidth = [_lessonDate.widthAnchor constraintEqualToConstant:halfWidth];
    
    NSLayoutConstraint *teacherTop = [_lessonTeacher.topAnchor constraintEqualToAnchor:_lessonName.bottomAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *teacherRight = [_lessonTeacher.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *teacherBottom = [_lessonTeacher.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *teacherLeft = [_lessonTeacher.leftAnchor constraintEqualToAnchor:_lessonDate.rightAnchor constant:cellBoundsOffset];
    
    [NSLayoutConstraint activateConstraints:@[nameTop, nameLeft, nameHight, nameRight,
                                              dataTop, dataLeft, dataBottom, dataWidth,
                                              teacherTop, teacherRight, teacherBottom, teacherLeft
                                              ]];
}

-(void)setDateWithString:(NSString *)date
{
    _lessonDate.text = date;
}

@end
