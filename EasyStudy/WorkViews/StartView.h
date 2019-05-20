//
//  StartView.h
//  EasyStudy
//
//  Created by Владимир on 15/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"
@import Firebase;

@interface StartView : UIView <ErrorDelegate>

@property (nonatomic, weak) id<StartDelegate> startDelegate;
-(void)giveEnterForm;
-(void)giveRegisterForm;

@end

