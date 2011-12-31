//
//  scoreboardTeamStatsViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardPlayerStatsViewController.h"

@interface scoreboardTeamStatsViewController : UIViewController

@property(strong, nonatomic)IBOutlet UISegmentedControl *statsModeControl;
@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;

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


-(IBAction)changeStatsMode:(id)sender;

@end
