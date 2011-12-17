//
//  scoreboardMainPageViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardMainPageViewController.h"
#import "scoreboardOptionPageViewController.h"
#import "scoreboardStatisticViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation scoreboardMainPageViewController
@synthesize HomeScore;
@synthesize GuestScore;
@synthesize countDownClock;
@synthesize HomeFouls;
@synthesize GuestFouls;
@synthesize HomeTOL;
@synthesize GuestTOL;
@synthesize pageControl;
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    pageControl.numberOfPages=2;
    pageControl.currentPage=0;
    [pageControl addTarget:self action:@selector(pageAction) forControlEvents:UIControlEventTouchUpInside];
    

    CGRect frame;
    //frame2.origin.x = self.scrollView.frame.size.width * 1;
//    frame.origin.x=self.scrollView.frame.size.width * 1;
//    frame.origin.y =0;
    frame.origin.x=0;
    frame.origin.y =self.scrollView.frame.size.height*1;
    frame.size = self.scrollView.frame.size;
        scoreboardStatisticViewController *ScoreboardStatisticViewController= [[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
    ScoreboardStatisticViewController.view.frame = frame; 
    [self.scrollView addSubview:ScoreboardStatisticViewController.view];
     self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*2);
         

    

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

-(IBAction)minusHomeScore:(id)sender{
    int homeScore=[HomeScore.text intValue];
    if(homeScore>0){
    homeScore--;
    HomeScore.text=[NSString stringWithFormat:@"%d",homeScore];
    }
}

-(IBAction)addGuestScoreClicked:(id)sender{
    int guestScore=[GuestScore.text intValue];
    guestScore++;
    GuestScore.text=[NSString stringWithFormat:@"%d",guestScore];
}

-(IBAction)minusGuestScore:(id)sender{
    int guestScore=[GuestScore.text intValue];
    if(guestScore>0){
    guestScore--;
    GuestScore.text=[NSString stringWithFormat:@"%d",guestScore];
    }
}
-(IBAction)countDownClockClicked:(id)sender{
    
    if([countDownTimer isValid]){

        [countDownTimer invalidate];
    }
    else if(time>0){
        countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
}

-(IBAction)optionClicked:(id)sender{
    scoreboardOptionPageViewController *modalViewController=[[scoreboardOptionPageViewController alloc]initWithNibName:@"scoreboardOptionPageViewController" bundle:nil];
    modalViewController.delegate=self;
    [modalViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:modalViewController animated:YES];
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

-(void)modeSelected:(int)gameMode{
    switch (gameMode) {
        case 0:
            time=600;
            [self countDown];
            break;
        case 1:
            time=720;
            [self countDown];
            break;
        case 2:
            time=1200;
            [self countDown];
            break;
        case 11:
            break;
            
        default:
            break;
    }
}

-(void)pageAction{
//    scoreboardOptionPageViewController *modalViewController=[[scoreboardOptionPageViewController alloc]initWithNibName:@"scoreboardOptionPageViewController" bundle:nil];
//
//    [self presentModalViewController:modalViewController animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // Update the page when more than 50% of the previous/next page is visible
//    CGFloat pageWidth = self.scrollView.frame.size.width;
//    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = page;
}
@end
