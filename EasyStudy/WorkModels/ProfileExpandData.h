//
//  ProfileExpandData.h
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileExpandData : NSObject

@property (nonatomic, assign) bool isExpanded;
@property (nonatomic, retain) NSArray<NSString *> *infos;

-(id)initWithIsExpanded:(BOOL)isExpanded infoStrings:(NSArray<NSString *> *)infoStrings;

@end

NS_ASSUME_NONNULL_END
