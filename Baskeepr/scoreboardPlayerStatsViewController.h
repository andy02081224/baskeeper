//
//  scoreboardPlayerStatsViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardTeamStatsViewController.h"

@interface scoreboardPlayerStatsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>




@property(strong, nonatomic)IBOutlet UISegmentedControl *statsModeControl;
@property(strong, nonatomic)IBOutlet UITableView *statsTable;


-(IBAction)changeStatsMode:(id)sender;



@end
