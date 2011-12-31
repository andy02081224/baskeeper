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
#import "scoreboardStatisticOptionViewController.h"
#import "scoreboardTeamStatsViewController.h"
//#import <QuartzCore/QuartzCore.h>


@implementation scoreboardMainPageViewController

@synthesize HomeName;
@synthesize GuestName;
@synthesize HomeScore;
@synthesize GuestScore;
@synthesize HomeFouls;
@synthesize GuestFouls;
@synthesize HomeTOL;
@synthesize GuestTOL;
@synthesize HomeBonus;
@synthesize GuestBonus;
@synthesize ncaaHomeBonus;
@synthesize ncaaGuestBonus;
@synthesize labelPeriod;
@synthesize Mode;
@synthesize modeName;

@synthesize periodControl;

@synthesize scrollView;
@synthesize countDownClock;
@synthesize statisticViewController;
@synthesize teamStatsViewController;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //Time=600;
        [self loadMode];//Question:Why it doesn't work here but do work in viewDidLoad?


//                statisticViewController= [[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
//                        teamStatsViewController= [[scoreboardTeamStatsViewController alloc]initWithNibName:@"scoreboardTeamStatsViewController" bundle:nil];
        
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
    [self loadMode];
//    CGRect frame;
//    CGRect frame2;
////    frame.origin.x=self.scrollView.frame.size.width * 1;
////    frame.origin.y =0;
//    frame.origin.x=0;
//    frame.origin.y =self.scrollView.frame.size.height*1;
//    frame.size = self.scrollView.frame.size;
//    
//    frame2.origin.x=0;
//    frame2.origin.y =self.scrollView.frame.size.height*2;
//    frame2.size = self.scrollView.frame.size;
//    
//
//    
//    statisticViewController.view.frame = frame; 
//    teamStatsViewController.view.frame= frame2;
//    
//    [self.scrollView addSubview:statisticViewController.view];
//    [self.scrollView addSubview:teamStatsViewController.view];
//    
//     self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*1, self.scrollView.frame.size.height*3);
       


    
    

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

-(NSString*)modeFilePath{
    // 找資料夾
    NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [dirs objectAtIndex:0];
    
    // 回傳資料夾 + 檔案名稱
    return [documentsPath stringByAppendingPathComponent:@"mode.archivedObject"];
}

-(void)loadMode{
    NSDictionary *modeLoaded=[NSKeyedUnarchiver unarchiveObjectWithFile:[self modeFilePath]];
    if(modeLoaded){
        self.Mode=[NSMutableDictionary dictionaryWithDictionary:modeLoaded]; 
        Time=[[self.Mode objectForKey:@"time"]intValue];
        [self setClock];
        Period=[[self.Mode objectForKey:@"period"]doubleValue];
        [self setPeriod];
        Foul=[[self.Mode objectForKey:@"foul"]intValue];
        [self setFoul];
        TOL=[[self.Mode objectForKey:@"tol"]intValue];
        [self setTOL];
        
    }
    else{
        self.Mode=[NSMutableDictionary dictionaryWithCapacity:4]; 
    }
}

-(void)saveMode:(NSDictionary*)GameMode{
    [NSKeyedArchiver archiveRootObject:GameMode toFile:[self modeFilePath]];
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
    int homeScore=[self.HomeScore.text intValue];
    homeScore++;
    self.HomeScore.text=[NSString stringWithFormat:@"%d",homeScore];

}

-(IBAction)minusHomeScore:(id)sender{
    int homeScore=[self.HomeScore.text intValue];
    if(homeScore>0){
    homeScore--;
    self.HomeScore.text=[NSString stringWithFormat:@"%d",homeScore];
    }
}

-(IBAction)addGuestScoreClicked:(id)sender{
    int guestScore=[self.GuestScore.text intValue];
    guestScore++;
    self.GuestScore.text=[NSString stringWithFormat:@"%d",guestScore];
}

-(IBAction)minusGuestScore:(id)sender{
    int guestScore=[self.GuestScore.text intValue];
    if(guestScore>0){
    guestScore--;
    self.GuestScore.text=[NSString stringWithFormat:@"%d",guestScore];
    }
}

-(IBAction)addHomeFoul:(id)sender{
    int f=[self.HomeFouls.text intValue];
    f++;
    self.HomeFouls.text=[NSString stringWithFormat:@"%d",f];
        [self setBonus:@"home" forFoul:f];
}

-(IBAction)minusHomeFoul:(id)sender{
    int f=[self.HomeFouls.text intValue];
    if(f>0){
    f--;
        self.HomeFouls.text=[NSString stringWithFormat:@"%d",f];
            [self setBonus:@"home" forFoul:f];
    }  
}

-(IBAction)addGuestFoul:(id)sender{
    int f=[self.GuestFouls.text intValue];
    f++;
    self.GuestFouls.text=[NSString stringWithFormat:@"%d",f];
        [self setBonus:@"guest" forFoul:f];
}

-(IBAction)minusGuestFoul:(id)sender{
    int f=[self.GuestFouls.text intValue];
    if(f>0){
    f--;
        self.GuestFouls.text=[NSString stringWithFormat:@"%d",f];
            [self setBonus:@"guest" forFoul:f];
    }  
}

-(IBAction)addHomeTOL:(id)sender{
    int tol=[self.HomeTOL.text intValue];
    tol++;
    self.HomeTOL.text=[NSString stringWithFormat:@"%d",tol];
}

-(IBAction)minusHomeTOL:(id)sender{
    int tol=[self.HomeTOL.text intValue];
    if(tol>0){
    tol--;
        self.HomeTOL.text=[NSString stringWithFormat:@"%d",tol]; } 
}

-(IBAction)addGuestTOL:(id)sender{
    int tol=[self.GuestTOL.text intValue];
    tol++;
    self.GuestTOL.text=[NSString stringWithFormat:@"%d",tol];
}

-(IBAction)minusGuestTOL:(id)sender{
    int tol=[self.GuestTOL.text intValue];
    if(tol>0){
    tol--;
        self.GuestTOL.text=[NSString stringWithFormat:@"%d",tol];}
}

-(IBAction)countDownClockClicked:(id)sender{
    
    if([countDownTimer isValid]){

        [countDownTimer invalidate];
    }
    else if(Time>0){
        countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
}

-(IBAction)optionClicked:(id)sender{
    scoreboardOptionPageViewController *modalViewController=[[scoreboardOptionPageViewController alloc]initWithNibName:@"scoreboardOptionPageViewController" bundle:nil];
    modalViewController.delegate=self;
    //[modalViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:modalViewController animated:YES];
}

-(IBAction)periodChanged:(id)sender{
    self.labelPeriod.text=[NSString stringWithFormat:@"%.0f",periodControl.value];
}



-(void)countDown{
    Time-=1;
    int seconds=Time%60;
    int minutes=(Time-seconds)/60;
    countDownClock.text=[NSString stringWithFormat:@"%.2d:%.2d",minutes,seconds];
    if(Time==0){
        [countDownTimer invalidate];
    }
}

-(void)setClock{
    int seconds=Time%60;
    int minutes=(Time-seconds)/60; 
    countDownClock.text=[NSString stringWithFormat:@"%.2d:%.2d",minutes,seconds];

}

-(void)setPeriod{
    [periodControl setMaximumValue:Period];
    [periodControl setMinimumValue:1.0];
    [periodControl setValue:1.0];
    [self periodChanged:nil];  
}

-(void)setFoul{
    self.HomeFouls.text=@"0";
    self.GuestFouls.text=@"0";
    [self setBonus:@"home" forFoul:0];
    [self setBonus:@"guest" forFoul:0];
}

-(void)setTOL{
 
    self.HomeTOL.text=[NSString stringWithFormat:@"%d",TOL]; 
    self.GuestTOL.text=[NSString stringWithFormat:@"%d",TOL];
}

-(void)setBonus:(NSString*)team forFoul:(int)foul{
    if([team isEqualToString:@"home"]&&foul>Foul){
        
        HomeBonus.hidden=NO;
        //因應NCAA比較特殊的團隊犯規規則
        if([modeName isEqualToString:@"ncaa"]&&foul<10){
            ncaaHomeBonus.text=@"1-1";
            ncaaHomeBonus.hidden=NO;
        }
        if([modeName isEqualToString:@"ncaa"]&&foul>9){
            ncaaHomeBonus.text=@"2";
        }
    }
    if([team isEqualToString:@"guest"]&&foul>Foul){
        GuestBonus.hidden=NO;
        if([modeName isEqualToString:@"ncaa"]&&foul<10){
            ncaaGuestBonus.text=@"1-1";
            ncaaGuestBonus.hidden=NO;
        }
        if([modeName isEqualToString:@"ncaa"]&&foul>9){
            ncaaGuestBonus.text=@"2";
        }
    }
    if([team isEqualToString:@"home"]&&foul<=Foul){
        HomeBonus.hidden=YES;
            ncaaHomeBonus.hidden=YES;
        
    }
    if([team isEqualToString:@"guest"]&&foul<=Foul){
        GuestBonus.hidden=YES;
            ncaaGuestBonus.hidden=YES;
        
    }

    
}

-(void)modeSelected:(NSDictionary*)gameMode{
    
    self.modeName=[gameMode objectForKey:@"modeName"];
    Time=[[gameMode objectForKey:@"time"]intValue];
    [self setClock];
    Period=[[gameMode objectForKey:@"period"]doubleValue];
    [self setPeriod];
    Foul=[[gameMode objectForKey:@"foul"]intValue];
    [self setFoul];
    TOL=[[gameMode objectForKey:@"tol"]intValue];
    [self setTOL];
    if([gameMode objectForKey:@"homeName"]){
        HomeName.text=[gameMode objectForKey:@"homeName"];
    } 
    if([gameMode objectForKey:@"guestName"]){
        GuestName.text=[gameMode objectForKey:@"guestName"];
    }
    
    
    [self saveMode:gameMode];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // Update the page when more than 50% of the previous/next page is visible
//    CGFloat pageWidth = self.scrollView.frame.size.width;
//    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = page;
}




@end
