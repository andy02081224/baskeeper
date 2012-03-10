//
//  teamMainPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardTeamStatsViewController.h"
#import "teamAddTeamViewController.h"
#import "Game.h"
#import "Team.h"
#import "Player.h"
#import "teamIntroductionPageViewController.h"
#import "teamPlayerPageViewController.h"
#import "teamGamePageVIewController.h"


@interface teamMainPageViewController : UITableViewController<addTeamDelegate,playerPageDelegate,teamStatsDelegate>{
    int teamIndex;
}

@property(strong, nonatomic)NSMutableArray *dataSource;
@property(strong, nonatomic)NSString *sectionTitleKey;
@property(strong, nonatomic)NSMutableArray *teams;
@property(strong, nonatomic)scoreboardTeamStatsViewController *teamStats;
@property(copy)Game *gameAdded;
@property(strong, nonatomic)NSString *test;


-(void)newPlayerAddedToTeam;
-(void)newTeamAdded:(Team*)team;
-(void)newGameAddedToTeam:(Game *)game;
-(void)loadTeams;
-(void)saveTeams;
-(NSString*)teamFilePath;

@end
