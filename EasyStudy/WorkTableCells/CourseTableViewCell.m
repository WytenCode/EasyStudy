//
//  CourseTableViewCell.m
//  EasyStudy
//
//  Created by Владимир on 07/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "CourseTableViewCell.h"

static const CGFloat cellBoundsOffset = 5.0f;
static const CGFloat cellHeight = 80.0f;

@interface CourseTableViewCell()

@property (nonatomic, strong) UILabel *courseName;
@property (nonatomic, strong) UILabel *courseDateInfo;
@property (nonatomic, strong) UILabel *courseStatusInfo;

@end

@implementation CourseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self)
        return nil;
    
    self.backgroundColor = [UIColor whiteColor];
    
    _courseName = [UILabel new];
    _courseName.textAlignment = NSTextAlignmentLeft;
    [_courseName setFont:[UIFont boldSystemFontOfSize:16.0f]];
    _courseName.text = @"Some course name";
    _courseName.translatesAutoresizingMaskIntoConstraints = NO;
    
    _courseDateInfo = [UILabel new];
    _courseDateInfo.textAlignment = NSTextAlignmentLeft;
    [_courseDateInfo setFont:[UIFont systemFontOfSize:14.0f]];
    _courseDateInfo.text = @"Februadry 23rd";
    _courseDateInfo.translatesAutoresizingMaskIntoConstraints = NO;
    
    _courseStatusInfo = [UILabel new];
    _courseStatusInfo.textAlignment = NSTextAlignmentRight;
    [_courseStatusInfo setFont:[UIFont systemFontOfSize:14.0f]];
    _courseStatusInfo.text = @"Online";
    _courseStatusInfo.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:_courseName];
    [self.contentView addSubview:_courseDateInfo];
    [self.contentView addSubview:_courseStatusInfo];
    
    [self makeConstraints];
    
    return self;
}

-(void)makeConstraints
{
    CGFloat rowHeight = (cellHeight - 2 * cellBoundsOffset)/2;
    CGFloat halfWidth = (self.frame.size.width - 3 * cellBoundsOffset)/2;
    
    NSLayoutConstraint *nameTop = [_courseName.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *nameLeft = [_courseName.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *nameRight = [_courseName.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *nameHight = [_courseName.heightAnchor constraintEqualToConstant:rowHeight];

    NSLayoutConstraint *dataTop = [_courseDateInfo.topAnchor constraintEqualToAnchor:_courseName.bottomAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *dataLeft = [_courseDateInfo.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *dataBottom = [_courseDateInfo.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *dataWidth = [_courseDateInfo.widthAnchor constraintEqualToConstant:halfWidth];

    NSLayoutConstraint *statusTop = [_courseStatusInfo.topAnchor constraintEqualToAnchor:_courseName.bottomAnchor constant:cellBoundsOffset];
    NSLayoutConstraint *statusRight = [_courseStatusInfo.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *statusBottom = [_courseStatusInfo.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-cellBoundsOffset];
    NSLayoutConstraint *statusLeft = [_courseStatusInfo.leftAnchor constraintEqualToAnchor:_courseDateInfo.rightAnchor constant:cellBoundsOffset];
    
    [NSLayoutConstraint activateConstraints:@[nameTop, nameLeft, nameHight, nameRight,
                                              dataTop, dataLeft, dataBottom, dataWidth,
                                              statusTop, statusLeft, statusRight, statusBottom
                                              ]];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(NSString *)getCourseName
{
    return _courseName.text;
}

-(void)setCourseNameWithName:(NSString *)name
{
    if (!_courseName)
        return;
    _courseName.text = name;
}

@end
