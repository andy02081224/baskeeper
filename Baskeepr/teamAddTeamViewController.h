//
//  teamAddTeamViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"

@protocol addTeamDelegate <NSObject>

-(void)newTeamAdded:(Team*)team;

@end

@interface teamAddTeamViewController : UIViewController
@property(strong, nonatomic)id<addTeamDelegate>delegate;
@property(strong, nonatomic)IBOutlet UITextField *nameField;
@property(strong, nonatomic)IBOutlet UITextField *locationField;
@property(strong, nonatomic)IBOutlet UITextField *coachField;
@property(strong, nonatomic)IBOutlet UITextField *captainField;
//@property(strong, nonatomic)IBOutlet UITextView *introductionView;

-(IBAction)doEditField:(id)sender;
-(IBAction)doHitBackground:(id)sender;


@end
