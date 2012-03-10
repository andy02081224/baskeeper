//
//  baskeeperInfoViewController.m
//  Baskeepr
//
//  Created by andy on 12/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "baskeeperInfoViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation baskeeperInfoViewController
@synthesize backButton;

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
    
    //Set scoreboard Button appearance
    [[self.backButton layer]setCornerRadius:8.0f];
    [[self.backButton layer]setBorderWidth:1.2f];
    [[self.backButton layer]setBorderColor:[UIColor whiteColor].CGColor ];
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
    //        else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
    //            return YES;
    //        }
    else{
        return NO;
    }
}

-(IBAction)backButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
