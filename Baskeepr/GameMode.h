//
//  GameMode.h
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameMode : NSObject<NSCoding>

@property(strong, nonatomic)NSString *time;
@property(strong, nonatomic)NSString *period;
@property(strong, nonatomic)NSString *foul;
@property(strong, nonatomic)NSString *timeOutLeft;
@end
