//
//  ViewController.h
//  EasyStudy
//
//  Created by Владимир on 30/04/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"


@interface ViewController : UIViewController <ErrorDelegate>

@property (nonatomic, weak) id<DataServiceDelegate>dataDelegate;
@property (nonatomic, weak) id<ErrorDelegate>myErrorDelegate;

@end

