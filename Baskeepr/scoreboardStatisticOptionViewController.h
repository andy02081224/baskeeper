//
//  scoreboardStatisticOptionViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAX_ROLL 1000
@interface scoreboardStatisticOptionViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    UISegmentedControl *positionControll;
    UIPickerView *numberPicker;
    NSMutableArray *numbers;
}

@property(strong, nonatomic)IBOutlet UILabel *position;
@property(strong, nonatomic)IBOutlet UISegmentedControl *positionControll;
@property(strong, nonatomic)IBOutlet UIPickerView *numberPicker;
@property(strong, nonatomic)NSMutableArray *numbers;

-(IBAction)positionChosen:(id)sender;
-(IBAction)dismissButtonClicked:(id)sender;
@end
