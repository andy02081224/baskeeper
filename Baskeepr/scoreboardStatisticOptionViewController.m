//
//  scoreboardStatisticOptionViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardStatisticOptionViewController.h"

@implementation scoreboardStatisticOptionViewController
@synthesize  position;
@synthesize positionControll;

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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)positionChosen:(id)sender{
    if (positionControll.selectedSegmentIndex==0) {
        position.text=@"PG";
    }
    if (positionControll.selectedSegmentIndex==1) {
        position.text=@"SG";
    }
    if (positionControll.selectedSegmentIndex==2) {
        position.text=@"SF";
    }
    if (positionControll.selectedSegmentIndex==3) {
        position.text=@"PF";
    }
    if (positionControll.selectedSegmentIndex==4) {
        position.text=@"C";
    }
    
}

@end
