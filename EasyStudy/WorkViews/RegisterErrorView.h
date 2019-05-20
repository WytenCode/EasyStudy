//
//  RegisterErrorView.h
//  EasyStudy
//
//  Created by Владимир on 16/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterErrorView : UIView

-(void)setErrorProfileWithText:(NSString *)text;
-(void)setSuccessProfileWithText:(NSString *)text;
-(void)makeMove;

@end

