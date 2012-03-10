//
//  Team.h
//  Baskeepr
//
//  Created by andy on 11/12/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Team : NSObject<NSCoding>
@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *location;
@property(strong, nonatomic)NSString* coach;
@property(strong, nonatomic)NSString *captain;
@property(strong, nonatomic)NSString *introduction;
@property(strong, nonatomic)NSMutableArray *players;
@property(strong, nonatomic)NSMutableArray *games;


@end
