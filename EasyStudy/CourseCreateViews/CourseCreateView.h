//
//  CourseCreateView.h
//  EasyStudy
//
//  Created by Владимир on 19/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface CourseCreateView : UIView

@property (nonatomic, weak) id<CreateCourseDelegate> myCreateDelegate;

@end

