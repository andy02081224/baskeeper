//
//  scoreboardOptionCustomViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scoreboardOptionCustomViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property(strong, nonatomic)IBOutlet UILabel *labelHomeName;
@property(strong, nonatomic)IBOutlet UITextField *homeName;
@property(strong, nonatomic)IBOutlet UILabel *labelHomeScore;
@property(strong, nonatomic)IBOutlet UIStepper *homeScoreControl;
@property(strong, nonatomic)IBOutlet UILabel *labelHomeFoul;
@property(strong, nonatomic)IBOutlet UIStepper *homeFoulControl;
@property(strong, nonatomic)IBOutlet UILabel *labelHomeTOL;
@property(strong, nonatomic)IBOutlet UIStepper *homeTOLControl;

@property(strong, nonatomic)IBOutlet UILabel *labelGuestName;
@property(strong, nonatomic)IBOutlet UITextField *guestName;
@property(strong, nonatomic)IBOutlet UILabel *labelGuestScore;
@property(strong, nonatomic)IBOutlet UIStepper *guestScoreControl;
@property(strong, nonatomic)IBOutlet UILabel *labelGuestFoul;
@property(strong, nonatomic)IBOutlet UIStepper *guestFoulControl;
@property(strong, nonatomic)IBOutlet UILabel *labelGuestTOL;
@property(strong, nonatomic)IBOutlet UIStepper *guestTOLControl;

@property(strong, nonatomic)IBOutlet UILabel *labelName;
@property(strong, nonatomic)IBOutlet UILabel *labelScore;
@property(strong, nonatomic)IBOutlet UILabel *labelFoul;
@property(strong, nonatomic)IBOutlet UILabel *labelTOL;

@property(strong, nonatomic)IBOutlet UILabel *labelMin;
@property(strong, nonatomic)IBOutlet UILabel *labelSec;
@property(strong, nonatomic)IBOutlet UILabel *labelPeriod;

@property(strong, nonatomic)IBOutlet UIPickerView *timePicker;
@property(strong, nonatomic)IBOutlet UISegmentedControl *customItem;

@property(strong, nonatomic)NSMutableArray *minutes;
@property(strong, nonatomic)NSMutableArray *seconds;
@property(strong, nonatomic)NSMutableArray *period;

-(IBAction)customItemClicked:(id)sender;
-(IBAction)backButtonClicked:(id)sender;
-(IBAction)doEditField:(id)sender;
-(IBAction)hitBackground:(id)sender;
-(IBAction)changeHomeScore:(id)sender;
-(IBAction)changeHomeFoul:(id)sender;
-(IBAction)changeHomeTOL:(id)sender;
-(IBAction)changeGuestScore:(id)sender;
-(IBAction)changeGuestFoul:(id)sender;
-(IBAction)changeGuestTOL:(id)sender;

@end
