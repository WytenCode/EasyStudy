//
//  CourseCreateCell.h
//  EasyStudy
//
//  Created by Владимир on 20/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CourseCreateCell : UICollectionViewCell

-(void)prepareTextLabelWithText:(NSString *)text;
-(NSString *)giveTitle;

@end

