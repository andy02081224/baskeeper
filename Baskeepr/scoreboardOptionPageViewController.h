//
//  scoreboardOptionPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "scoreboardOptionCustomViewController.h"
@protocol scoreboardOptionPageViewControllerDelegate <NSObject,UIPickerViewDelegate,UIPickerViewDataSource>

-(void)modeSelected:(NSDictionary*)gameMode;



@end

@interface scoreboardOptionPageViewController : UIViewController<OptionCustomDelegate>

@property(strong, nonatomic) IBOutlet UIButton *nbaButton;
@property(strong, nonatomic) IBOutlet UIButton *fibaButton;
@property(strong, nonatomic) IBOutlet UIButton *ncaaButton;
@property(strong, nonatomic) IBOutlet UIButton *customButton;
@property(strong, nonatomic)IBOutlet UIButton *save;
@property(strong, nonatomic)NSString *gameMode;
@property(strong, nonatomic)NSDictionary *fiba;
@property(strong, nonatomic)NSDictionary *nba;
@property(strong, nonatomic)NSDictionary *ncaa;
@property(strong, nonatomic)NSDictionary *custom;
@property(strong, nonatomic)id<scoreboardOptionPageViewControllerDelegate>
delegate;

@property(strong, nonatomic)IBOutlet UILabel *test;

-(IBAction)nbaButtonClicked:(id)sender;
-(IBAction)fibaButtonClicked:(id)sender;
-(IBAction)ncaaButtonClicked:(id)sender;
-(IBAction)customButtonClicked:(id)sender;
-(IBAction)backButtonClicked:(id)sender;
-(IBAction)saveButtonClicked:(id)sender;

-(void)setCustomMode:(NSDictionary*)customData;

-(void)loadGameMode:(NSString*)GameMode;





@end
