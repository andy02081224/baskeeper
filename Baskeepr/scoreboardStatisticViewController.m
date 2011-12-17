//
//  scoreboardStatisticViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardStatisticViewController.h"
#import "scoreboardStatisticOptionViewController.h"
#import "scoreboardOptionPageViewController.h"

@implementation scoreboardStatisticViewController
@synthesize scrollView;

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
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*1.4, self.scrollView.frame.size.height);
    [self.view addSubview:scrollView];
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

-(IBAction)optionClicked:(id)sender{
//    scoreboardStatisticOptionViewController *modalViewController=[[scoreboardStatisticOptionViewController alloc]initWithNibName:@"scoreboardStatisticOptionViewController" bundle:nil];
//        [modalViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//    [self presentModalViewController:modalViewController animated:YES];
    
    scoreboardOptionPageViewController *modalViewController=[[scoreboardOptionPageViewController alloc]initWithNibName:@"scoreboardOptionPageViewController" bundle:nil];
    //modalViewController.delegate=self;
    [modalViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:modalViewController animated:YES];
    
}

@end
