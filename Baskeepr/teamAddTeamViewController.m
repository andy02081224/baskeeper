//
//  teamAddTeamViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "teamAddTeamViewController.h"

@implementation teamAddTeamViewController
@synthesize delegate;
@synthesize nameField, locationField, coachField, captainField; 
//@synthesize introductionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addButtonClicked:)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if(interfaceOrientation==UIInterfaceOrientationLandscapeLeft){
        return YES;
    }
    else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
        return YES;
    }
    else{
        return NO;
    }

}

-(void)cancelButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)addButtonClicked:(id)sender{
    Team *team=[[Team alloc]init];
    team.name=self.nameField.text;
    team.location=self.locationField.text;
    team.coach=self.coachField.text;
    team.captain=self.captainField.text;
    
    [delegate newTeamAdded:team];
}

-(IBAction)doEditField:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)doHitBackground:(id)sender{

    
    [self.nameField resignFirstResponder];
    [self.locationField resignFirstResponder];
    [self.coachField resignFirstResponder];
    [self.captainField resignFirstResponder];

}
@end
