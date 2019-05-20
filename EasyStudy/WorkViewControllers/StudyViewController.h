//
//  StudyViewController.h
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface StudyViewController : UIViewController <StudyDelegate>

@property (nonatomic, weak) id<CourseDelegate> myCourseDelegate;

@end

