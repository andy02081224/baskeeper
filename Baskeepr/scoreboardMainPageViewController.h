//
//  scoreboardMainPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scoreboardMainPageViewController : UIViewController{
    int time;
    NSTimer *countDownTimer;
}

@property(strong, nonatomic)UIViewController *parent;
@property(strong, nonatomic)IBOutlet UILabel *HomeScore;
@property(strong, nonatomic)IBOutlet UILabel *GuestScore;
@property(strong, nonatomic)IBOutlet UILabel *countDownClock;


-(IBAction)dismissButtonClicked:(id)sender;
-(IBAction)addHomeScoreCliked:(id)sender;
-(IBAction)addGuestScoreClicked:(id)sender;
-(IBAction)countDownClockClicked:(id)sender;
-(void)countDown;

@end
