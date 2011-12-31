//
//  ViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/6.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scoreboardOptionPageViewController.h"
#import "scoreboardModeChoiceViewController.h"
#import "teamMainPageViewController.h"


@interface ViewController : UIViewController

@property(strong, nonatomic)IBOutlet UIButton *scoreoardButton;
@property(strong, nonatomic)IBOutlet UIButton *teamButton;
@property(strong, nonatomic)IBOutlet UIButton *optionButton;

@property(strong, nonatomic)teamMainPageViewController *teamViewController;

-(IBAction)scoreboardButtonClicked:(id)sender;
-(IBAction)teamButtonClicked:(id)sender;
@end
