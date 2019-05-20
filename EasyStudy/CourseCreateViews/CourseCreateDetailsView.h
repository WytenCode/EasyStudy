//
//  CourseCreateDetailsView.h
//  EasyStudy
//
//  Created by Владимир on 20/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface CourseCreateDetailsView : UIView

@property (nonatomic, weak) id<CreateCourseDelegate> myCreateDelegate;

@end

