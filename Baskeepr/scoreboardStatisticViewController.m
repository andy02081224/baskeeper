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
#import <QuartzCore/QuartzCore.h>


@implementation scoreboardStatisticViewController
@synthesize scrollView;
@synthesize labelPG;
@synthesize labelSG;
@synthesize labelSF;
@synthesize labelPF;
@synthesize labelCenter;

@synthesize labelTime;
@synthesize labelPeriod;
@synthesize labelScore;
@synthesize countDownTimer;
@synthesize periodControl;
@synthesize teamStatsViewController;

@synthesize PG;
@synthesize SG;
@synthesize SF;
@synthesize PF;
@synthesize Center;

//PG Stats
@synthesize pgFGA;
@synthesize pgFGM;
@synthesize pg3PA;
@synthesize pg3PM;
@synthesize pgFTA;
@synthesize pgFTM;
@synthesize pgDefReb;
@synthesize pgOffReb;
@synthesize pgAST;
@synthesize pgPF;
@synthesize pgST;
@synthesize pgTO;
@synthesize pgBS;

//SG Stats
@synthesize sgFGA;
@synthesize sgFGM;
@synthesize sg3PA;
@synthesize sg3PM;
@synthesize sgFTA;
@synthesize sgFTM;
@synthesize sgDefReb;
@synthesize sgOffReb;
@synthesize sgAST;
@synthesize sgPF;
@synthesize sgST;
@synthesize sgTO;
@synthesize sgBS;

//SF Stats
@synthesize sfFGA;
@synthesize sfFGM;
@synthesize sf3PA;
@synthesize sf3PM;
@synthesize sfFTA;
@synthesize sfFTM;
@synthesize sfDefReb;
@synthesize sfOffReb;
@synthesize sfAST;
@synthesize sfPF;
@synthesize sfST;
@synthesize sfTO;
@synthesize sfBS;

//SF Stats
@synthesize pfFGA;
@synthesize pfFGM;
@synthesize pf3PA;
@synthesize pf3PM;
@synthesize pfFTA;
@synthesize pfFTM;
@synthesize pfDefReb;
@synthesize pfOffReb;
@synthesize pfAST;
@synthesize pfPF;
@synthesize pfST;
@synthesize pfTO;
@synthesize pfBS;

//Center Stats
@synthesize centerFGA;
@synthesize centerFGM;
@synthesize center3PA;
@synthesize center3PM;
@synthesize centerFTA;
@synthesize centerFTM;
@synthesize centerDefReb;
@synthesize centerOffReb;
@synthesize centerAST;
@synthesize centerPF;
@synthesize centerST;
@synthesize centerTO;
@synthesize centerBS;

@synthesize mylabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labelPG.text=@"PG";
        self.labelSG.text=@"SG";
        self.labelSF.text=@"SF";
        self.labelPF.text=@"PF";
        self.labelCenter.text=@"C";
        
        time=600;
        

        teamStatsViewController= [[scoreboardTeamStatsViewController alloc]initWithNibName:@"scoreboardTeamStatsViewController" bundle:nil];
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
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*1.6, self.scrollView.frame.size.height);

    UIAccelerometer *accelerometer=[UIAccelerometer sharedAccelerometer];
    accelerometer.delegate=self;
    accelerometer.updateInterval=1.0f/60.f;
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

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
    static NSInteger shakeCount=0;
    static NSDate *shakeStart;
    
    NSDate *now=[[NSDate alloc] init];
    //搖晃時間在２秒內
    NSDate *checkDate=[[NSDate alloc] initWithTimeInterval:2.0f sinceDate:shakeStart];
    
    //超過２秒則重新計算搖晃次數
    if ([now compare:checkDate]==NSOrderedDescending||shakeStart==nil){
        shakeCount=0;
        shakeStart=[[NSDate alloc] init];                                
    }
    

    //三軸搖晃的G力超過２則列入計次
    if (fabsf(acceleration.x)>2.0 || fabsf(acceleration.y)>2.0|| fabsf(acceleration.z)>2.0){
        shakeCount++;
        
        //２秒內偵測到４次則判定為Shake搖晃手機
        if (shakeCount>2){
            shakeCount=0;

            shakeStart=[[NSDate alloc] init];
            
                CATransition *transition=[CATransition animation];
                [transition setDelegate:self];
                [transition setDuration:2.0f];
                [transition setType:@"rippleEffect"];
                [[self.view layer]addAnimation:transition forKey:@"SomeAnim"];
                [[self.view layer]addAnimation:transition forKey:@"test"];
            
            scoreboardPlayerStatsViewController *modalViewController=[[scoreboardPlayerStatsViewController alloc]initWithNibName:@"scoreboardPlayerStatsViewController" bundle:nil];
            [self presentModalViewController:modalViewController animated:YES];
            
            
            
            //畫面顯示搖動文字
//            mylabel.text=@"搖動";
            
            //設定２秒後自動還原                
//            [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(cleartext) userInfo:nil repeats:NO];
        }
    }
}                


-(void)setPositionNumbers:(NSArray *)position{
    self.PG=[position objectAtIndex:0];
    self.SG=[position objectAtIndex:1];
    self.SF=[position objectAtIndex:2];
    self.PF=[position objectAtIndex:3];
    self.Center=[position objectAtIndex:4];
        self.labelPG.text=[self.PG objectAtIndex:indexPG];
        self.labelSG.text=[self.SG objectAtIndex:indexSG];
        self.labelSF.text=[self.SF objectAtIndex:indexSF];
        self.labelPF.text=[self.PF objectAtIndex:indexPF];
        self.labelCenter.text=[self.Center objectAtIndex:indexCenter];
    
    
}

-(IBAction)changePGNumbers:(id)sender{
        indexPG++;
    if(indexPG<[self.PG count]){

        self.labelPG.text=[self.PG objectAtIndex:indexPG];
    }
    else{
        indexPG=0;
        self.labelPG.text=[self.PG objectAtIndex:indexPG];        
    }
}

-(IBAction)changeSGNumbers:(id)sender{
    indexSG++;
    if(indexSG<[self.SG count]){
        
        self.labelSG.text=[self.SG objectAtIndex:indexSG];
    }
    else{
        indexSG=0;
        self.labelSG.text=[self.SG objectAtIndex:indexSG];        
    }
}

-(IBAction)changeSFNumbers:(id)sender{
    indexSF++;
    if(indexSF<[self.SF count]){
        
        self.labelSF.text=[self.SF objectAtIndex:indexSF];
    }
    else{
        indexSF=0;
        self.labelSF.text=[self.SF objectAtIndex:indexSF];        
    }
}

-(IBAction)changePFNumbers:(id)sender{
    indexPF++;
    if(indexPF<[self.PF count]){
        
        self.labelPF.text=[self.PF objectAtIndex:indexPF];
    }
    else{
        indexPF=0;
        self.labelPF.text=[self.PF objectAtIndex:indexPF];        
    }
}

-(IBAction)changeCenterNumbers:(id)sender{
    indexCenter++;
    if(indexCenter<[self.Center count]){
        
        self.labelCenter.text=[self.Center objectAtIndex:indexCenter];
    }
    else{
        indexCenter=0;
        self.labelCenter.text=[self.Center objectAtIndex:indexCenter];        
    }
}

-(IBAction)optionButtonClicked:(id)sender{
    
    scoreboardStatisticOptionViewController *modalViewController=[[scoreboardStatisticOptionViewController alloc]initWithNibName:@"scoreboardStatisticOptionViewController" bundle:nil];
    modalViewController.delegate=self;
        [modalViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:modalViewController animated:YES];
    //[(UIViewController *)[[[[self view] superview] superview] nextResponder] presentModalViewController:modalViewController animated:YES];
    
}

-(IBAction)changePeriod:(id)sender{
    self.labelPeriod.text=[NSString stringWithFormat:@"%.0f",periodControl.value];
}

-(IBAction)changePGStats:(id)sender{
    
}

-(IBAction)changeSGStats:(id)sender{
    
}

-(IBAction)backButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)countDownClockClicked:(id)sender{
    if([countDownTimer isValid]){
        
        [countDownTimer invalidate];
    }
    else if(time>0){
        countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    } 
}

-(IBAction)nextPage:(id)sender{
    scoreboardPlayerStatsViewController *modalViewController=[[scoreboardPlayerStatsViewController alloc]initWithNibName:@"scoreboardPlayerStatsViewController" bundle:nil];
    [self presentModalViewController:modalViewController animated:YES];
}

-(void)setClock{
    
}

-(void)countDown{
    time-=1;
    int seconds=time%60;
    int minutes=(time-seconds)/60;
    self.labelTime.text=[NSString stringWithFormat:@"%.2d:%.2d",minutes,seconds];
    if(time==0){
        [countDownTimer invalidate];
    }

}






@end
