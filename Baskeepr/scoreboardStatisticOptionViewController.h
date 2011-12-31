//
//  scoreboardStatisticOptionViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "playerStats.h"

#define MAX_ROLL 1000
@protocol statisticOptionDelegate<NSObject>
-(void)setPositionNumbers:(NSArray*)position;
@end
@interface scoreboardStatisticOptionViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>{
    UISegmentedControl *positionControll;
    UIPickerView *numberPicker;
    NSMutableArray *numbers;

}

@property(strong, nonatomic)id<statisticOptionDelegate> delegate;

@property(strong, nonatomic)IBOutlet UILabel *position;
@property(strong, nonatomic)IBOutlet UISegmentedControl *positionControll;
@property(strong, nonatomic)IBOutlet UIPickerView *numberPicker;
@property(strong, nonatomic)NSMutableArray *numbers;

@property(strong, nonatomic)NSMutableArray *pointGuard;
@property(strong, nonatomic)NSMutableArray *shootingGuard;
@property(strong, nonatomic)NSMutableArray *smallFoward;
@property(strong, nonatomic)NSMutableArray *powerFoward;
@property(strong, nonatomic)NSMutableArray *center;

@property(strong, nonatomic)NSString* numberChosen;
@property(strong, nonatomic)IBOutlet UILabel*labelPGChosen;
@property(strong, nonatomic)IBOutlet UILabel*labelSGChosen;
@property(strong, nonatomic)IBOutlet UILabel*labelSFChosen;
@property(strong, nonatomic)IBOutlet UILabel*labelPFChosen;
@property(strong, nonatomic)IBOutlet UILabel*labelCenterChosen;

@property(strong, nonatomic)IBOutlet UILabel *test;





-(IBAction)positionChosen:(id)sender;
-(IBAction)dismissButtonClicked:(id)sender;
-(IBAction)addButtonClicked:(id)sender;
-(IBAction)deleteButtonClicked:(id)sender;

-(void)addPlayerChosen;
-(void)deletePlayerChosen;
@end
