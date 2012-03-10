//
//  Game.h
//  Baskeepr
//
//  Created by andy on 12/1/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject<NSCoding>

@property(strong, nonatomic)NSString *gameDate;
@property(strong, nonatomic)NSString *opponentName;
@property(strong, nonatomic)NSString *opponentScore;
@property(strong, nonatomic)NSString *gameResults;


@end
