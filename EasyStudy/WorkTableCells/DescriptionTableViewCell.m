//
//  DescriptionTableViewCell.m
//  EasyStudy
//
//  Created by Владимир on 10/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "DescriptionTableViewCell.h"

@interface DescriptionTableViewCell()

@property (nonatomic , assign) NSString *shortText;
@property (nonatomic , assign) NSString *fullText;


@end

@implementation DescriptionTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self)
        return nil;
    [self.textLabel setFont:[UIFont systemFontOfSize:16.0f]];
    _shortText = @"Описание";
    self.textLabel.text = _shortText;
    return self;
}

-(void)setBigTextWithText:(NSString *)text
{
    _fullText = text;
}

-(void)changeText
{
    if ([self.textLabel.text isEqualToString:_shortText])
        self.textLabel.text = _fullText;
    else
        self.textLabel.text = _shortText;
    self.textLabel.numberOfLines = [self calculateCourseInfoLines] + 1;
}

-(NSInteger)calculateCourseInfoLines
{
    NSInteger lineCount = 0;
    CGSize constraint = CGSizeMake(self.frame.size.width, CGFLOAT_MAX);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [self.textLabel.text boundingRectWithSize:constraint
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName:self.textLabel.font}
                                                        context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    long charSize = lroundf(self.textLabel.font.lineHeight);
    lineCount = size.height/charSize;
    return lineCount;
}

@end
