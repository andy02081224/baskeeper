//
//  scoreboardModeChoiceViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardModeChoiceViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation scoreboardModeChoiceViewController
@synthesize teamButton;
@synthesize playerButton;

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
    
    //Set team Button appearance
    [[teamButton layer]setCornerRadius:8.0f];
    [[teamButton layer]setBorderWidth:5.0f];
    [[teamButton layer]setBackgroundColor:[UIColor colorWithWhite:0.75f alpha:0.7f].CGColor];
    [[teamButton layer]setBorderColor:[UIColor blackColor].CGColor ];
    //Set player Button appearance
    [[playerButton layer]setCornerRadius:8.0f];
    [[playerButton layer]setBorderWidth:5.0f];
    [[playerButton layer]setBorderColor:[UIColor whiteColor].CGColor ];
    [[playerButton layer]setBackgroundColor:[UIColor colorWithWhite:0.75f alpha:0.7f].CGColor];
    
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
//    else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
//        return YES;
//    }
    else{
        return NO;
    }

}

-(IBAction)teamButtonClicked:(id)sender{
        scoreboardMainPageViewController *modalViewController=[[scoreboardMainPageViewController alloc]initWithNibName:@"scoreboardMainPageViewController" bundle:nil];
        [modalViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentModalViewController:modalViewController animated:YES];
}

-(IBAction)playerButtonClicked:(id)sender{
        scoreboardStatisticViewController *modalViewController=[[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
        [modalViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentModalViewController:modalViewController animated:YES];
}

-(IBAction)homeButtonClicked:(id)sender{
    ViewController *modalViewController=[[ViewController alloc]initWithNibName:@"ViewController_iPhone" bundle:nil];
    [modalViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:modalViewController animated:YES];
}

@end
