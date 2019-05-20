//
//  DatabaseService.h
//  EasyStudy
//
//  Created by Владимир on 17/05/2019.
//  Copyright © 2019 Владимир. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"
@import FirebaseDatabase;

@interface DatabaseService : NSObject <DataServiceDelegate>

@property (nonatomic, weak) id<ErrorDelegate>myErrorDelegate;
@property (nonatomic, weak) id<StartDelegate>myStartDelegate;

-(FIRDatabaseReference *)getUsersReference;
-(FIRDatabaseReference *)getGeneralReference;

@end

