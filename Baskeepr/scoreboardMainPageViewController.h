//
//  scoreboardMainPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardOptionPageViewController.h"
#import "scoreboardStatisticViewController.h"
#import "scoreboardTeamStatsViewController.h"



@interface scoreboardMainPageViewController : UIViewController<scoreboardOptionPageViewControllerDelegate,UIScrollViewDelegate>{
    int Time;
    double Period;
    int Fouls;
    int TOL;
    NSTimer *countDownTimer;
    UIScrollView *scrollView;
    NSMutableDictionary *Mode;
}




@property(strong, nonatomic)UIViewController *parent;





@property(strong, nonatomic)IBOutlet UILabel *HomeScore;
@property(strong, nonatomic)IBOutlet UILabel *GuestScore;
@property(strong, nonatomic)IBOutlet UILabel *HomeFouls;
@property(strong, nonatomic)IBOutlet UILabel *GuestFouls;
@property(strong, nonatomic)IBOutlet UILabel *HomeTOL;
@property(strong, nonatomic)IBOutlet UILabel *GuestTOL;
@property(strong, nonatomic)IBOutlet UILabel *labelPeriod;
@property(strong, nonatomic)IBOutlet UILabel *countDownClock;
@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic)IBOutlet UIStepper *periodControl;
@property(strong, nonatomic)NSMutableDictionary *Mode;
@property(strong, nonatomic)scoreboardStatisticViewController *statisticViewController;

@property(strong, nonatomic)scoreboardTeamStatsViewController *teamStatsViewController;


-(IBAction)dismissButtonClicked:(id)sender;
-(IBAction)addHomeScoreCliked:(id)sender;
-(IBAction)addGuestScoreClicked:(id)sender;
-(IBAction)minusHomeScore:(id)sender;
-(IBAction)minusGuestScore:(id)sender;
-(IBAction)addHomeFoul:(id)sender;
-(IBAction)addGuestFoul:(id)sender;
-(IBAction)minusHomeFoul:(id)sender;
-(IBAction)minusGuestFoul:(id)sender;
-(IBAction)addHomeTOL:(id)sender;
-(IBAction)addGuestTOL:(id)sender;
-(IBAction)minusHomeTOL:(id)sender;
-(IBAction)minusGuestTOL:(id)sender;

-(IBAction)periodChanged:(id)sender;

-(IBAction)countDownClockClicked:(id)sender;
-(IBAction)optionClicked:(id)sender;
-(void)countDown;
-(void)modeSelected;
-(void)setClock;

-(NSString*)modeFilePath;
-(void)loadMode;
-(void)saveMode:(NSDictionary*)GameMode;


@end
