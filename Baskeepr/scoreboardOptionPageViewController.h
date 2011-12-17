//
//  scoreboardOptionPageViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameMode.h"
@protocol scoreboardOptionPageViewControllerDelegate <NSObject>

-(void)modeSelected:(int)gameMode;


@end

@interface scoreboardOptionPageViewController : UIViewController

@property(strong, nonatomic) IBOutlet UIButton *nbaButton;
@property(strong, nonatomic) IBOutlet UIButton *fibaButton;
@property(strong, nonatomic) IBOutlet UIButton *ncaaButton;
@property(strong, nonatomic) IBOutlet UIButton *customButton;
@property(strong, nonatomic)NSString *gameMode;
@property(strong, nonatomic)id<scoreboardOptionPageViewControllerDelegate>delegate;

-(IBAction)nbaButtonClicked:(id)sender;
-(IBAction)fibaButtonClicked:(id)sender;
-(IBAction)ncaaButtonClicked:(id)sender;
-(IBAction)customButtonClicked:(id)sender;




@end
