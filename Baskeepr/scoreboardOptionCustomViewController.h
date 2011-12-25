//
//  scoreboardOptionCustomViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameMode.h"
@protocol OptionCustomDelegate<NSObject>
-(void)setCustomMode:(NSDictionary*)customData;

@end
@interface scoreboardOptionCustomViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    int minSelected;
    int secSelected;
    int periodSelected;
    
}
@property(strong, nonatomic)id<OptionCustomDelegate>delegate;

@property(strong, nonatomic)IBOutlet UILabel *labelHomeName;
@property(strong, nonatomic)IBOutlet UITextField *homeName;
@property(strong, nonatomic)IBOutlet UILabel *labelGuestName;
@property(strong, nonatomic)IBOutlet UITextField *guestName;
@property(strong, nonatomic)IBOutlet UIStepper *foulControl;
@property(strong, nonatomic)IBOutlet UIStepper *tolControl;
@property(strong, nonatomic)IBOutlet UILabel *foulLimit;
@property(strong, nonatomic)IBOutlet UILabel *timeOutLeft;

@property(strong, nonatomic)IBOutlet UILabel *labelName;
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
@property(strong, nonatomic)IBOutlet UILabel *test;

//@property(strong, nonatomic)NSMutableDictionary *custom;

-(IBAction)customItemClicked:(id)sender;
-(IBAction)backButtonClicked:(id)sender;
-(IBAction)doEditField:(id)sender;
-(IBAction)hitBackground:(id)sender;
-(IBAction)changeFoul:(id)sender;
-(IBAction)changeTOL:(id)sender;

-(void)loadSettings;

@end
