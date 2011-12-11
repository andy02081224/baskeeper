//
//  scoreboardMainPageViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardMainPageViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation scoreboardMainPageViewController
@synthesize HomeScore;
@synthesize GuestScore;
@synthesize countDownClock;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        time=600;
    //[UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;
        
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

-(void)viewWillAppear:(BOOL)animated{

    //[UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;
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

-(IBAction)dismissButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(UIViewController *)parent{
    return self.parentViewController;
}

-(void)setParent:(UIViewController *)parent{
    [self setValue:parent forKey:@"_parentViewController"];
}

-(IBAction)addHomeScoreCliked:(id)sender{
    int homeScore=[HomeScore.text intValue];
    homeScore++;
    HomeScore.text=[NSString stringWithFormat:@"%d",homeScore];

}
-(IBAction)addGuestScoreClicked:(id)sender{
    int guestScore=[GuestScore.text intValue];
    guestScore++;
    GuestScore.text=[NSString stringWithFormat:@"%d",guestScore];
}

-(IBAction)countDownClockClicked:(id)sender{
    
    if([countDownTimer isValid]){

        [countDownTimer invalidate];
    }
    else if(time>0){
        countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
}

-(void)countDown{
    time-=1;
    int seconds=time%60;
    int minutes=(time-seconds)/60;
    countDownClock.text=[NSString stringWithFormat:@"%d:%.2d",minutes,seconds];
    if(time==0){
        [countDownTimer invalidate];
    }
}
@end
