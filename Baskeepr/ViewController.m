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
#import "baskeeperInfoViewController.h"


@implementation ViewController

@synthesize scoreoardButton;
@synthesize teamButton;

//@synthesize teamViewController;



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
    [[self.scoreoardButton layer]setCornerRadius:8.0f];
    [[self.scoreoardButton layer]setBorderWidth:1.2f];
    [[self.scoreoardButton layer]setBorderColor:[UIColor whiteColor].CGColor ];
    
    //Set team Button appearance
    [[self.teamButton layer]setCornerRadius:8.0f];
    [[self.teamButton layer]setBorderWidth:1.2f];
    [[self.teamButton layer]setBorderColor:[UIColor whiteColor].CGColor ];

    
    
    
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
//        else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
//            return YES;
//        }
        else{
            return NO;
        }
    } else {
        return NO;
    }
}


-(IBAction)scoreboardButtonClicked:(id)sender{
    

    scoreboardModeChoiceViewController *modalViewController=[[scoreboardModeChoiceViewController alloc]initWithNibName:@"scoreboardModeChoiceViewController" bundle:nil];
    [modalViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:modalViewController animated:YES];
}

-(IBAction)teamButtonClicked:(id)sender{
    
    teamMainPageViewController *teamViewController=[[teamMainPageViewController alloc]initWithStyle:UITableViewStyleGrouped];

    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:teamViewController];
    [navController  setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:navController animated:YES];
    
}

-(IBAction)infoButtonClicked:(id)sender{
    baskeeperInfoViewController *modalViewController=[[baskeeperInfoViewController alloc]initWithNibName:@"baskeeperInfoViewController" bundle:nil];
    //[modalViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:modalViewController animated:YES];
    
}

@end
