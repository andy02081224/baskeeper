//
//  scoreboardMainPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardOptionPageViewController.h"




@interface scoreboardMainPageViewController : UIViewController<scoreboardOptionPageViewControllerDelegate,UIScrollViewDelegate>{
    int time;
    int period;
    NSTimer *countDownTimer;
    UIPageControl *pageControl;
    UIScrollView *scrollView;
}




@property(strong, nonatomic)UIViewController *parent;





@property(strong, nonatomic)IBOutlet UILabel *HomeScore;
@property(strong, nonatomic)IBOutlet UILabel *GuestScore;
@property(strong, nonatomic)IBOutlet UILabel *countDownClock;
@property(strong, nonatomic)IBOutlet UILabel *HomeFouls;
@property(strong, nonatomic)IBOutlet UILabel *GuestFouls;
@property(strong, nonatomic)IBOutlet UILabel *HomeTOL;
@property(strong, nonatomic)IBOutlet UILabel *GuestTOL;

@property(strong, nonatomic)IBOutlet UIPageControl *pageControl;
@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;



-(IBAction)dismissButtonClicked:(id)sender;
-(IBAction)addHomeScoreCliked:(id)sender;
-(IBAction)addGuestScoreClicked:(id)sender;
-(IBAction)countDownClockClicked:(id)sender;
-(IBAction)optionClicked:(id)sender;
-(IBAction)minusHomeScore:(id)sender;
-(IBAction)minusGuestScore:(id)sender;


-(void)countDown;
-(void)modeSelected:(int)gameMode;
-(void)pageAction;

@end
