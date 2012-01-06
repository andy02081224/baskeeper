//
//  Player.h
//  Baskeepr
//
//  Created by andy on 12/1/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject<NSCoding>

@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *number;
@property(strong, nonatomic)NSString *height;
@property(strong, nonatomic)NSString *weight;

@end
