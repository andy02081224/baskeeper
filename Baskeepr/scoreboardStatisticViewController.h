//
//  scoreboardStatisticViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "playerStats.h"


#import "teamGamePageVIewController.h"
#import "scoreboardStatisticOptionViewController.h"
#import "scoreboardPlayerStatsViewController.h"
#import "scoreboardTeamStatsViewController.h"
#import "scoreboardModeChoiceViewController.h"


@protocol statsViewControllerDelegate <NSObject>

@optional

- (void)setPlayerStats:(playerStats*)playerStats;
- (void)updateScore:(NSString *)score;
- (void)updatePeriod:(NSString *)period;
- (void)dismissBoxView;

@end


@interface scoreboardStatisticViewController : UIViewController<statisticOptionDelegate,UIAccelerometerDelegate>{
    UIScrollView *scrollView;
    int time;
    int indexPG;
    int indexSG;
    int indexSF;
    int indexPF;
    int indexCenter;
}

@property(strong, nonatomic)id<statsViewControllerDelegate>delegate;
@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic)NSString *gameMode;
@property(strong, nonatomic)NSString *teamName;
@property(strong, nonatomic)IBOutlet UILabel *labelPG;
@property(strong, nonatomic)IBOutlet UILabel *labelSG;
@property(strong, nonatomic)IBOutlet UILabel *labelSF;
@property(strong, nonatomic)IBOutlet UILabel *labelPF;
@property(strong, nonatomic)IBOutlet UILabel *labelCenter;

@property(strong, nonatomic)IBOutlet UILabel*labelTime;
@property(strong, nonatomic)IBOutlet UILabel*labelPeriod;
@property(strong, nonatomic)IBOutlet UILabel*labelScore;

@property(strong, nonatomic)IBOutlet UILabel*mylabel;


@property(copy)NSArray *positionFromTeam;
@property(strong, nonatomic)NSMutableArray *PG;
@property(strong, nonatomic)NSMutableArray *SG;
@property(strong, nonatomic)NSMutableArray *SF;
@property(strong, nonatomic)NSMutableArray *PF;
@property(strong, nonatomic)NSMutableArray *Center;
//PG
@property(strong, nonatomic)IBOutlet UILabel * pgFGA;
@property(strong, nonatomic)IBOutlet UILabel * pgFGM;
@property(strong, nonatomic)IBOutlet UILabel * pg3PA;
@property(strong, nonatomic)IBOutlet UILabel * pg3PM;
@property(strong, nonatomic)IBOutlet UILabel * pgFTA;
@property(strong, nonatomic)IBOutlet UILabel * pgFTM;
@property(strong, nonatomic)IBOutlet UILabel * pgDefReb;
@property(strong, nonatomic)IBOutlet UILabel * pgOffReb;
@property(strong, nonatomic)IBOutlet UILabel * pgAST;
@property(strong, nonatomic)IBOutlet UILabel * pgPF;
@property(strong, nonatomic)IBOutlet UILabel * pgST;
@property(strong, nonatomic)IBOutlet UILabel * pgTO;
@property(strong, nonatomic)IBOutlet UILabel * pgBS;
//SG
@property(strong, nonatomic)IBOutlet UILabel * sgFGA;
@property(strong, nonatomic)IBOutlet UILabel * sgFGM;
@property(strong, nonatomic)IBOutlet UILabel * sg3PA;
@property(strong, nonatomic)IBOutlet UILabel * sg3PM;
@property(strong, nonatomic)IBOutlet UILabel * sgFTA;
@property(strong, nonatomic)IBOutlet UILabel * sgFTM;
@property(strong, nonatomic)IBOutlet UILabel * sgDefReb;
@property(strong, nonatomic)IBOutlet UILabel * sgOffReb;
@property(strong, nonatomic)IBOutlet UILabel * sgAST;
@property(strong, nonatomic)IBOutlet UILabel * sgPF;
@property(strong, nonatomic)IBOutlet UILabel * sgST;
@property(strong, nonatomic)IBOutlet UILabel * sgTO;
@property(strong, nonatomic)IBOutlet UILabel * sgBS;
//SF
@property(strong, nonatomic)IBOutlet UILabel * sfFGA;
@property(strong, nonatomic)IBOutlet UILabel * sfFGM;
@property(strong, nonatomic)IBOutlet UILabel * sf3PA;
@property(strong, nonatomic)IBOutlet UILabel * sf3PM;
@property(strong, nonatomic)IBOutlet UILabel * sfFTA;
@property(strong, nonatomic)IBOutlet UILabel * sfFTM;
@property(strong, nonatomic)IBOutlet UILabel * sfDefReb;
@property(strong, nonatomic)IBOutlet UILabel * sfOffReb;
@property(strong, nonatomic)IBOutlet UILabel * sfAST;
@property(strong, nonatomic)IBOutlet UILabel * sfPF;
@property(strong, nonatomic)IBOutlet UILabel * sfST;
@property(strong, nonatomic)IBOutlet UILabel * sfTO;
@property(strong, nonatomic)IBOutlet UILabel * sfBS;
//PF
@property(strong, nonatomic)IBOutlet UILabel * pfFGA;
@property(strong, nonatomic)IBOutlet UILabel * pfFGM;
@property(strong, nonatomic)IBOutlet UILabel * pf3PA;
@property(strong, nonatomic)IBOutlet UILabel * pf3PM;
@property(strong, nonatomic)IBOutlet UILabel * pfFTA;
@property(strong, nonatomic)IBOutlet UILabel * pfFTM;
@property(strong, nonatomic)IBOutlet UILabel * pfDefReb;
@property(strong, nonatomic)IBOutlet UILabel * pfOffReb;
@property(strong, nonatomic)IBOutlet UILabel * pfAST;
@property(strong, nonatomic)IBOutlet UILabel * pfPF;
@property(strong, nonatomic)IBOutlet UILabel * pfST;
@property(strong, nonatomic)IBOutlet UILabel * pfTO;
@property(strong, nonatomic)IBOutlet UILabel * pfBS;
//Center
@property(strong, nonatomic)IBOutlet UILabel * centerFGA;
@property(strong, nonatomic)IBOutlet UILabel * centerFGM;
@property(strong, nonatomic)IBOutlet UILabel * center3PA;
@property(strong, nonatomic)IBOutlet UILabel * center3PM;
@property(strong, nonatomic)IBOutlet UILabel * centerFTA;
@property(strong, nonatomic)IBOutlet UILabel * centerFTM;
@property(strong, nonatomic)IBOutlet UILabel * centerDefReb;
@property(strong, nonatomic)IBOutlet UILabel * centerOffReb;
@property(strong, nonatomic)IBOutlet UILabel * centerAST;
@property(strong, nonatomic)IBOutlet UILabel * centerPF;
@property(strong, nonatomic)IBOutlet UILabel * centerST;
@property(strong, nonatomic)IBOutlet UILabel * centerTO;
@property(strong, nonatomic)IBOutlet UILabel * centerBS;


@property(strong, nonatomic)IBOutlet UIStepper *periodControl;
@property(strong, nonatomic)NSTimer *countDownTimer;
//@property(strong,nonatomic)NSMutableArray *playerStats;

@property(strong,nonatomic)NSMutableArray *PGStats;
@property(strong,nonatomic)NSMutableArray *SGStats;
@property(strong,nonatomic)NSMutableArray *SFStats;
@property(strong,nonatomic)NSMutableArray *PFStats;
@property(strong,nonatomic)NSMutableArray *CenterStats;


//@property(strong, nonatomic)scoreboardTeamStatsViewController *teamStatsViewController;


-(NSString*)PGFilePath;
-(NSString*)SGFilePath;
-(NSString*)SFFilePath;
-(NSString*)PFFilePath;
-(NSString*)CenterFilePath;


-(void)loadStats;
-(void)saveStats;


-(IBAction)optionButtonClicked:(id)sender;
-(IBAction)backButtonClicked:(id)sender;

-(IBAction)changePGNumbers:(id)sender;
-(IBAction)changeSGNumbers:(id)sender;
-(IBAction)changeSFNumbers:(id)sender;
-(IBAction)changePFNumbers:(id)sender;
-(IBAction)changeCenterNumbers:(id)sender;

-(IBAction)countDownClockClicked:(id)sender;
-(IBAction)changePeriod:(id)sender;
-(IBAction)nextPage:(id)sender;

-(IBAction)changePGStats:(id)sender;
-(IBAction)changeSGStats:(id)sender;
-(IBAction)changeSFStats:(id)sender;
-(IBAction)changePFStats:(id)sender;
-(IBAction)changeCenterStats:(id)sender;
-(IBAction)deleteAllNumbers:(id)sender;
-(void)resetAllNumbers;

-(void)updatePGStats;
-(void)updateSGStats;
-(void)updateSFStats;
-(void)updatePFStats;
-(void)updateCenterStats;
- (void)updateScoreLabel:(int)score;

-(void)addPGStats;
-(void)addSGStats;
-(void)addSFStats;
-(void)addPFStats;
-(void)addCenterStats;

-(void)loadPGStats;
-(void)loadSGStats;
-(void)loadSFStats;
-(void)loadPFStats;
-(void)loadCenterStats;

-(void)setPositionNumbersFromTeam;
-(void)setPositionNumbers:(NSArray*)position;
-(void)setClock;
-(void)countDown;

@end
