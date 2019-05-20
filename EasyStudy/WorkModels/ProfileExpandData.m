//
//  ProfileExpandData.m
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import "ProfileExpandData.h"

@implementation ProfileExpandData

-(id)initWithIsExpanded:(BOOL)isExpanded infoStrings:(NSArray<NSString *> *)infoStrings
{
    self = [ProfileExpandData new];
    self.isExpanded = isExpanded;
    self.infos = infoStrings;
    return self;
}

@end
