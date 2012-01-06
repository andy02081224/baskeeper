//
//  scoreboardModeChoiceViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardMainPageViewController.h"
#import "scoreboardStatisticViewController.h"
#import "ViewController.h"

@interface scoreboardModeChoiceViewController : UIViewController

@property(strong, nonatomic)IBOutlet UIButton *teamButton;
@property(strong, nonatomic)IBOutlet UIButton *playerButton;

-(IBAction)teamButtonClicked:(id)sender;
-(IBAction)playerButtonClicked:(id)sender;
-(IBAction)homeButtonClicked:(id)sender;

@end
