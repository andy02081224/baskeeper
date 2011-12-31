//
//  scoreboardTeamStatsViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardTeamStatsViewController.h"


@implementation scoreboardTeamStatsViewController
@synthesize statsModeControl;
@synthesize scrollView;

@synthesize labelPoints, labelFG, labelFGPercent, label3P, label3PPercent, labelFT, labelFTPercent, labelOffReb, labelTotalReb, labelAssists, labelFouls, labelSteals, labelTurnouvers, labelBlocks;

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
    self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*1.55);

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

-(IBAction)changeStatsMode:(id)sender{
    if(statsModeControl.selectedSegmentIndex==0){
        scoreboardPlayerStatsViewController *modalViewController=[[scoreboardPlayerStatsViewController alloc]initWithNibName:@"scoreboardPlayerStatsViewController" bundle:nil];
        [self presentModalViewController:modalViewController animated:NO];
    }
}

@end
