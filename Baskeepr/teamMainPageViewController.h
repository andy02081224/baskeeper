//
//  teamMainPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "teamAddTeamViewController.h"
#import "Team.h"
#import "teamIntroductionPageViewController.h"
#import "teamPlayerPageViewController.h"
#import "teamGamePageVIewController.h"

@interface teamMainPageViewController : UITableViewController<addTeamDelegate>

@property(strong, nonatomic)NSMutableArray *dataSource;
@property(strong, nonatomic)NSString *sectionTitleKey;
@property(strong, nonatomic)NSMutableArray *teams;


-(void)newTeamAdded:(Team*)team;
-(void)loadTeams;
-(void)saveTeams;
-(NSString*)teamFilePath;

@end
