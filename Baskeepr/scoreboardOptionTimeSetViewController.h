//
//  scoreboardOptionTimeSetViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scoreboardOptionTimeSetViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    UIPickerView *timeAndperiodPicker;
    NSMutableArray *minutes;
    NSMutableArray *seconds;
}

@property(strong, nonatomic)UIPickerView *timeAndperiodPicker;
@property(strong, nonatomic)NSMutableArray *minutes;
@property(strong, nonatomic)NSMutableArray *seconds;

@end
