//
//  CourseView.h
//  EasyStudy
//
//  Created by Владимир on 07/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface CourseView : UIView

@property (nonatomic, weak) id<CourseDetailDelegate> myCourseDetailDelegate;

@end

