//
//  scoreboardTeamStatsViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardPlayerStatsViewController.h"
#import "scoreboardStatisticViewController.h"
#import "playerStats.h"

@interface scoreboardTeamStatsViewController : UIViewController{
    float FGA;
    float FGM;
    float _3PA;
    float _3PM;
    float FTA;
    float FTM;
    int DefReb;
    int OffReb;
    int assists;
    int fouls;
    int steals;
    int turnovers;
    int blocks;
    
    int teamPoints;
    float teamFGPercent;
    float team3PPercent;
    float teamFTPercent;
    int teamTotalReb;
}

@property(strong, nonatomic)IBOutlet UISegmentedControl *statsModeControl;
@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;

@property(strong, nonatomic)IBOutlet UILabel *Score;
@property(strong, nonatomic)IBOutlet UILabel *labelPoints;
@property(strong, nonatomic)IBOutlet UILabel *labelFG;
@property(strong, nonatomic)IBOutlet UILabel *labelFGPercent;
@property(strong, nonatomic)IBOutlet UILabel *label3P;
@property(strong, nonatomic)IBOutlet UILabel *label3PPercent;
@property(strong, nonatomic)IBOutlet UILabel *labelFT;
@property(strong, nonatomic)IBOutlet UILabel *labelFTPercent;
@property(strong, nonatomic)IBOutlet UILabel *labelOffReb;
@property(strong, nonatomic)IBOutlet UILabel *labelTotalReb;
@property(strong, nonatomic)IBOutlet UILabel *labelAssists;
@property(strong, nonatomic)IBOutlet UILabel *labelFouls;
@property(strong, nonatomic)IBOutlet UILabel *labelSteals;
@property(strong, nonatomic)IBOutlet UILabel *labelTurnouvers;
@property(strong, nonatomic)IBOutlet UILabel *labelBlocks;

@property(strong,nonatomic)NSMutableArray *PGStats;
@property(strong,nonatomic)NSMutableArray *SGStats;
@property(strong,nonatomic)NSMutableArray *SFStats;
@property(strong,nonatomic)NSMutableArray *PFStats;
@property(strong,nonatomic)NSMutableArray *CenterStats;


-(IBAction)changeStatsMode:(id)sender;
-(IBAction)backButtonClicked:(id)sender;

-(void)setTeamStats;
-(void)calculateTeamStats;
-(void)showTeamStats;

@end
