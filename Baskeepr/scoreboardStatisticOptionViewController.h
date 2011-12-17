//
//  scoreboardStatisticOptionViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scoreboardStatisticOptionViewController : UIViewController{
    UISegmentedControl *positionControll;
}

@property(strong, nonatomic)IBOutlet UILabel *position;
@property(strong, nonatomic)UISegmentedControl *positionControll;

-(IBAction)positionChosen:(id)sender;

@end
