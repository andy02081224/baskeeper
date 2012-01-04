//
//  scoreboardPlayerStatsViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "playerStats.h"
#import "scoreboardStatisticViewController.h"
#import "scoreboardTeamStatsViewController.h"


@interface scoreboardPlayerStatsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    int point;
    int round;
}




@property(strong, nonatomic)IBOutlet UISegmentedControl *statsModeControl;
@property(strong, nonatomic)IBOutlet UITableView *statsTable;

@property(strong,nonatomic)NSMutableArray *PGStats;
@property(strong,nonatomic)NSMutableArray *SGStats;
@property(strong,nonatomic)NSMutableArray *SFStats;
@property(strong,nonatomic)NSMutableArray *PFStats;
@property(strong,nonatomic)NSMutableArray *CenterStats;
@property(strong, nonatomic)IBOutlet UILabel *test;


-(IBAction)changeStatsMode:(id)sender;

-(void)setPlayerStats:(playerStats*)playerStats;

-(IBAction)backButtonClicked:(id)sender;



@end
