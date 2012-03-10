//
//  teamAddPlayerViewController.h
//  Baskeepr
//
//  Created by andy on 12/1/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "player.h"

@protocol addPlayerDelegate <NSObject>

-(void)newPlayerAdded:(Player*)player;


@end

@interface teamAddPlayerViewController : UIViewController

@property(strong, nonatomic)id<addPlayerDelegate>delegate;
@property(strong, nonatomic)IBOutlet UITextField *nameField;
@property(strong, nonatomic)IBOutlet UITextField *numberField;
@property(strong, nonatomic)IBOutlet UILabel *positionLabel;
@property(strong, nonatomic)IBOutlet UITextField *heightField;
@property(strong, nonatomic)IBOutlet UITextField *weightField;
@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;

@property(strong, nonatomic)IBOutlet UIStepper *positionControl;

-(IBAction)changePostionClicked:(id)sender;
-(IBAction)doEditField:(id)sender;
-(IBAction)doHitBackground:(id)sender;
@end
