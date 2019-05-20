//
//  CourseTableViewCell.h
//  EasyStudy
//
//  Created by Владимир on 07/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CourseTableViewCell : UITableViewCell

-(NSString *)getCourseName;
-(void)setCourseNameWithName:(NSString *)name;

@end

