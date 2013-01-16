//
//  OnlineScoreboardViewController.h
//  Baskeepr
//
//  Created by andy on 13/1/5.
//
//

#import <UIKit/UIKit.h>
#import "scoreboardStatisticViewController.h"
#import "OnlineSettingsViewController.h"

@interface OnlineScoreboardViewController : UIViewController<statsViewControllerDelegate, OnlineSettingsDelegate>

@property (strong, nonatomic) IBOutlet UILabel *periodLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *foulLabel;
@property (strong, nonatomic) IBOutlet UILabel *TOLLabel;

@property (strong, nonatomic) IBOutlet UILabel *oppoScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *oppoFoulLabel;
@property (strong, nonatomic) IBOutlet UILabel *oppoTOLLabel;

- (IBAction)addFoulButtonClicked:(id)sender;
- (IBAction)minusFoulButtonClicked:(id)sender;
- (IBAction)MinusTOLButtonClicked:(id)sender;






@end
