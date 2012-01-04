//
//  playerStats.h
//  Baskeepr
//
//  Created by andy on 11/12/27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface playerStats : NSObject<NSCoding>

@property(strong, nonatomic)NSString *statsNumber;
@property(strong, nonatomic)NSString *statsPosition;
@property(strong, nonatomic)NSString *statsFGA;
@property(strong, nonatomic)NSString *statsFGM;
@property(strong, nonatomic)NSString *stats3PA;
@property(strong, nonatomic)NSString *stats3PM;
@property(strong, nonatomic)NSString *statsFTA;
@property(strong, nonatomic)NSString *statsFTM;
@property(strong, nonatomic)NSString *statsDefReb;
@property(strong, nonatomic)NSString *statsOffReb;
@property(strong, nonatomic)NSString *statsAST;
@property(strong, nonatomic)NSString *statsPF;
@property(strong, nonatomic)NSString *statsST;
@property(strong, nonatomic)NSString *statsTO;
@property(strong, nonatomic)NSString *statsBS;


@end
