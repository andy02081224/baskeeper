//
//  ViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/6.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "scoreboardMainPageViewController.h"
#import "teamMainPageViewController.h"

@implementation ViewController

@synthesize scoreoardButton;
@synthesize teamButton;
@synthesize optionButton;
@synthesize teamViewController;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // By implementing QuartzCore.framework(#import <QuartzCore/QuartzCore.h>)
    // Reference:http://stackoverflow.com/questions/8162411/how-to-create-border-in-uibutton
    
    //Set scoreboard Button appearance
    [[scoreoardButton layer]setCornerRadius:8.0f];
    [[scoreoardButton layer]setBorderWidth:1.2f];
    [[scoreoardButton layer]setBorderColor:[UIColor whiteColor].CGColor ];
    
    //Set team Button appearance
    [[teamButton layer]setCornerRadius:8.0f];
    [[teamButton layer]setBorderWidth:1.2f];
    [[teamButton layer]setBorderColor:[UIColor whiteColor].CGColor ];
    
    //Set option button appearance
    [[optionButton layer]setCornerRadius:8.0f];
    [[optionButton layer]setBorderWidth:1.2f];
    [[optionButton layer]setBorderColor:[UIColor whiteColor].CGColor ];
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if(interfaceOrientation==UIInterfaceOrientationLandscapeLeft){
            return YES;
        }
        else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
            return YES;
        }
        else{
            return NO;
        }
    } else {
        return NO;
    }
}


-(IBAction)scoreboardButtonClicked:(id)sender{
    
    scoreboardMainPageViewController *modalViewController=[[scoreboardMainPageViewController alloc]initWithNibName:@"scoreboardMainPageViewController" bundle:nil];
    [modalViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:modalViewController animated:YES];
}

-(IBAction)teamButtonClicked:(id)sender{
    self.teamViewController=[[teamMainPageViewController alloc]initWithStyle:UITableViewStyleGrouped];
//    teamMainPageViewController *modalViewController=[[teamMainPageViewController 
//                                                      alloc]initWithNibName:@"teamMainPageViewController" bundle:nil];
    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:self.teamViewController];
    [navController  setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:navController animated:YES];
    
}

@end
