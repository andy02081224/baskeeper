//
//  teamGamePageVIewController.h
//  Baskeepr
//
//  Created by andy on 12/1/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
#import "Player.h"
#import "Game.h"
#import "scoreboardStatisticViewController.h"
//#import "scoreboardTeamStatsViewController.h"


@protocol gamePageDelegate <NSObject>

-(void)setPositionNumbers:(NSArray*)position;

@end


@interface teamGamePageVIewController : UITableViewController

@property(strong, nonatomic)id<gamePageDelegate>delegate;
@property(strong, nonatomic)Team *teams;

@property(strong, nonatomic)NSMutableArray *players;

@property(strong, nonatomic)NSMutableArray *playerPG;
@property(strong, nonatomic)NSMutableArray *playerSG;
@property(strong, nonatomic)NSMutableArray *playerSF;
@property(strong, nonatomic)NSMutableArray *playerPF;
@property(strong, nonatomic)NSMutableArray *playerCenter;

@property(strong, nonatomic)NSMutableArray *games;



@property(strong, nonatomic)NSString *test;

-(void)setPositions;
-(void)newGameAdded:(Game*)game;

@end
