//
//  StudyView.h
//  EasyStudy
//
//  Created by Владимир on 04/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"


@interface StudyView : UIView <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<StudyDelegate> studyDelegate;

@end

