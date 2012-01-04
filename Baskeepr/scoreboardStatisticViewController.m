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
#import "playerStats.h"
#import <QuartzCore/QuartzCore.h>


@implementation scoreboardStatisticViewController

@synthesize delegate;
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

//@synthesize playerStats;
@synthesize PGStats;
@synthesize SGStats;
@synthesize SFStats;
@synthesize PFStats;
@synthesize CenterStats;

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
 
        
        //self.playerStatsViewController=[[scoreboardPlayerStatsViewController alloc]init];
        //playerStatsViewController.playerStats=self.playerStats;
        


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
           [self loadStats];
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

-(NSString*)statsFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirs objectAtIndex:0];
    
    // 回傳資料夾 + 檔案名稱
    return [docPath stringByAppendingPathComponent:@"playerStats.archivedObject"];
}

-(void)loadStats{
    NSArray *PGStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self statsFilePath]];
    if(PGStats){
        self.PGStats=[PGStats mutableCopy];
    }
    else{
        self.PGStats=[NSMutableArray array];
    }
    NSArray *SGStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self statsFilePath]];
    if(SGStats){
        self.SGStats=[SGStats mutableCopy];
    }
    else{
        self.SGStats=[NSMutableArray array];
    }
}

-(void)saveStats{
    [NSKeyedArchiver archiveRootObject:self.PGStats toFile:[self statsFilePath]];
    [NSKeyedArchiver archiveRootObject:self.SGStats toFile:[self statsFilePath]];
    //[NSKeyedArchiver archiveRootObject:self.SFStats toFile:[self statsFilePath]];
    //[NSKeyedArchiver archiveRootObject:self.PFStats toFile:[self statsFilePath]];
    //[NSKeyedArchiver archiveRootObject:self.CenterStats toFile:[self statsFilePath]];
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
       
    if([self.PG count]>0){    
        self.labelPG.text=[self.PG objectAtIndex:indexPG];
        [self addPGStats];
    }
    if ([self.SG count]>0) {
        self.labelSG.text=[self.SG objectAtIndex:indexSG];
        [self addSGStats];
    }
    if ([self.SF count]>0) {
        self.labelSF.text=[self.SF objectAtIndex:indexSF];
        [self addSFStats];
    }
    if ([self.PF count]>0) {
        self.labelPF.text=[self.PF objectAtIndex:indexPF];
        [self addPFStats];
    }
    if ([self.Center count]>0) {
        self.labelCenter.text=[self.Center objectAtIndex:indexCenter];
        [self addCenterStats];
    }

    
    
}



-(IBAction)changePGNumbers:(id)sender{
    if([self.PG count]>0){    
        indexPG++;
        if(indexPG<[self.PG count]){
            
            self.labelPG.text=[self.PG objectAtIndex:indexPG];
            
        }
        else{
        indexPG=0;
        self.labelPG.text=[self.PG objectAtIndex:indexPG];        
        }
        
        [self loadPGStats];
    }
}

-(IBAction)changeSGNumbers:(id)sender{
    if([self.SG count]>0){
        indexSG++;
        if(indexSG<[self.SG count]){
        
            self.labelSG.text=[self.SG objectAtIndex:indexSG];
        }
        else{
            indexSG=0;
            self.labelSG.text=[self.SG objectAtIndex:indexSG];        
        }
        
        [self loadSGStats];
    }
}

-(IBAction)changeSFNumbers:(id)sender{
    if([self.SF count]>0){
        indexSF++;
        if(indexSF<[self.SF count]){
        
            self.labelSF.text=[self.SF objectAtIndex:indexSF];
        }
        else{
            indexSF=0;
            self.labelSF.text=[self.SF objectAtIndex:indexSF];        
        }
        
        [self loadSFStats];
    }
}

-(IBAction)changePFNumbers:(id)sender{
    if([self.PF count]>0){
        indexPF++;
        if(indexPF<[self.PF count]){
        
            self.labelPF.text=[self.PF objectAtIndex:indexPF];
        }
        else{
            indexPF=0;
            self.labelPF.text=[self.PF objectAtIndex:indexPF];        
        }
        
        [self loadPFStats];
    }
}

-(IBAction)changeCenterNumbers:(id)sender{
    if([self.Center count]>0){
        indexCenter++;
        if(indexCenter<[self.Center count]){
        
            self.labelCenter.text=[self.Center objectAtIndex:indexCenter];
        }
        else{
            indexCenter=0;
            self.labelCenter.text=[self.Center objectAtIndex:indexCenter];        
        }
        
        [self loadCenterStats];
    }
}


-(void)loadPGStats{
    playerStats *stats=[self.PGStats objectAtIndex:indexPG];
    
    self.pgFGA.text= stats.statsFGA;
    self.pgFGM.text=stats.statsFGM;
    self.pg3PA.text=stats.stats3PA;
    self.pg3PM.text=stats.stats3PM;
    self.pgFTA.text=stats.statsFTA;
    self.pgFTM.text=stats.statsFTM;
    self.pgDefReb.text=stats.statsDefReb;
    self.pgOffReb.text=stats.statsOffReb;
    self.pgAST.text=stats.statsAST;
    self.pgPF.text=stats.statsPF;
    self.pgST.text=stats.statsST;
    self.pgTO.text=stats.statsTO;
    self.pgBS.text=stats.statsBS; 
}

-(void)loadSGStats{
    playerStats *stats=[self.SGStats objectAtIndex:indexSG];
    
    self.sgFGA.text= stats.statsFGA;
    self.sgFGM.text=stats.statsFGM;
    self.sg3PA.text=stats.stats3PA;
    self.sg3PM.text=stats.stats3PM;
    self.sgFTA.text=stats.statsFTA;
    self.sgFTM.text=stats.statsFTM;
    self.sgDefReb.text=stats.statsDefReb;
    self.sgOffReb.text=stats.statsOffReb;
    self.sgAST.text=stats.statsAST;
    self.sgPF.text=stats.statsPF;
    self.sgST.text=stats.statsST;
    self.sgTO.text=stats.statsTO;
    self.sgBS.text=stats.statsBS;
}

-(void)loadSFStats{
    playerStats *stats=[self.SFStats objectAtIndex:indexSF];
    
    self.sfFGA.text= stats.statsFGA;
    self.sfFGM.text=stats.statsFGM;
    self.sf3PA.text=stats.stats3PA;
    self.sf3PM.text=stats.stats3PM;
    self.sfFTA.text=stats.statsFTA;
    self.sfFTM.text=stats.statsFTM;
    self.sfDefReb.text=stats.statsDefReb;
    self.sfOffReb.text=stats.statsOffReb;
    self.sfAST.text=stats.statsAST;
    self.sfPF.text=stats.statsPF;
    self.sfST.text=stats.statsST;
    self.sfTO.text=stats.statsTO;
    self.sfBS.text=stats.statsBS; 
}

-(void)loadPFStats{
    playerStats *stats=[self.PFStats objectAtIndex:indexPF];
    
    self.pfFGA.text= stats.statsFGA;
    self.pfFGM.text=stats.statsFGM;
    self.pf3PA.text=stats.stats3PA;
    self.pf3PM.text=stats.stats3PM;
    self.pfFTA.text=stats.statsFTA;
    self.pfFTM.text=stats.statsFTM;
    self.pfDefReb.text=stats.statsDefReb;
    self.pfOffReb.text=stats.statsOffReb;
    self.pfAST.text=stats.statsAST;
    self.pfPF.text=stats.statsPF;
    self.pfST.text=stats.statsST;
    self.pfTO.text=stats.statsTO;
    self.pfBS.text=stats.statsBS;
}

-(void)loadCenterStats{
    playerStats *stats=[self.CenterStats objectAtIndex:indexCenter];
    
    self.centerFGA.text= stats.statsFGA;
    self.centerFGM.text=stats.statsFGM;
    self.center3PA.text=stats.stats3PA;
    self.center3PM.text=stats.stats3PM;
    self.centerFTA.text=stats.statsFTA;
    self.centerFTM.text=stats.statsFTM;
    self.centerDefReb.text=stats.statsDefReb;
    self.centerOffReb.text=stats.statsOffReb;
    self.centerAST.text=stats.statsAST;
    self.centerPF.text=stats.statsPF;
    self.centerST.text=stats.statsST;
    self.centerTO.text=stats.statsTO;
    self.centerBS.text=stats.statsBS;
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
    if([self.PG count]>0){
    UIButton *button=(UIButton*)sender;
    int index=button.tag;
    
    //Get current values
    int FGA=[self.pgFGA.text intValue];
    int FGM=[self.pgFGM.text intValue];
    int _3PA=[self.pg3PA.text intValue];
    int _3PM=[self.pg3PM.text intValue];
    int FTM=[self.pgFTM.text intValue];
    int FTA=[self.pgFTA.text intValue];
    int DefReb=[self.pgDefReb.text intValue];
    int OffReb=[self.pgOffReb.text intValue];
    int AST=[self.pgAST.text intValue];
    int PersonalFouls=[self.pgPF.text intValue];
    int ST=[self.pgST.text intValue];
    int TO=[self.pgTO.text intValue];
    int BS=[self.pgBS.text intValue];
    
    switch (index) {
        case 0:
            FGA++;
            self.pgFGA.text=[NSString stringWithFormat:@"%d",FGA];
            [self updatePGStats];
            break;
        case 1:
            FGM++;
            self.pgFGM.text=[NSString stringWithFormat:@"%d",FGM];
            [self updatePGStats];
            break;
        case 2:
            _3PA++;
            self.pg3PA.text=[NSString stringWithFormat:@"%d",_3PA];
            [self updatePGStats];
            break;
        case 3:
            _3PM++;
            self.pg3PM.text=[NSString stringWithFormat:@"%d",_3PM];
            [self updatePGStats];
            break;
        case 4:
            FTA++;
            self.pgFTA.text=[NSString stringWithFormat:@"%d",FTA];
            [self updatePGStats];
            break;
        case 5:
            FTM++;
            self.pgFTM.text=[NSString stringWithFormat:@"%d",FTM];
            [self updatePGStats];
            break;
        case 6:
            DefReb++;
            self.pgDefReb.text=[NSString stringWithFormat:@"%d",DefReb];
            [self updatePGStats];
            break;
        case 7:
            OffReb++;
            self.pgOffReb.text=[NSString stringWithFormat:@"%d",OffReb];
            [self updatePGStats];
            break;
        case 8:
            AST++;
            self.pgAST.text=[NSString stringWithFormat:@"%d",AST];
            [self updatePGStats];
            break;
        case 9:
            PersonalFouls++;
            self.pgPF.text=[NSString stringWithFormat:@"%d",PersonalFouls];
            [self updatePGStats];
            break;
        case 10:
            ST++;
            self.pgST.text=[NSString stringWithFormat:@"%d",ST];
            [self updatePGStats];
            break;
        case 11:
            TO++;
            self.pgTO.text=[NSString stringWithFormat:@"%d",TO];
            [self updatePGStats];
            break;
        case 12:
            BS++;
            self.pgBS.text=[NSString stringWithFormat:@"%d",BS];
            [self updatePGStats];
            break;
            
        default:
            break;
    }
    }
}

-(IBAction)changeSGStats:(id)sender{
    if([self.SG count]>0){
    UIButton *button=(UIButton*)sender;
    int index=button.tag;
    
    //Get current values
    int FGA=[self.sgFGA.text intValue];
    int FGM=[self.sgFGM.text intValue];
    int _3PA=[self.sg3PA.text intValue];
    int _3PM=[self.sg3PM.text intValue];
    int FTM=[self.sgFTM.text intValue];
    int FTA=[self.sgFTA.text intValue];
    int DefReb=[self.sgDefReb.text intValue];
    int OffReb=[self.sgOffReb.text intValue];
    int AST=[self.sgAST.text intValue];
    int PersonalFouls=[self.sgPF.text intValue];
    int ST=[self.sgST.text intValue];
    int TO=[self.sgTO.text intValue];
    int BS=[self.sgBS.text intValue];
    
    switch (index) {
        case 0:
            FGA++;
            self.sgFGA.text=[NSString stringWithFormat:@"%d",FGA];
            [self updateSGStats];
            break;
        case 1:
            FGM++;
            self.sgFGM.text=[NSString stringWithFormat:@"%d",FGM];
            [self updateSGStats];
            break;
        case 2:
            _3PA++;
            self.sg3PA.text=[NSString stringWithFormat:@"%d",_3PA];
            [self updateSGStats];
            break;
        case 3:
            _3PM++;
            self.sg3PM.text=[NSString stringWithFormat:@"%d",_3PM];
            [self updateSGStats];
            break;
        case 4:
            FTA++;
            self.sgFTA.text=[NSString stringWithFormat:@"%d",FTA];
            [self updateSGStats];
            break;
        case 5:
            FTM++;
            self.sgFTM.text=[NSString stringWithFormat:@"%d",FTM];
            [self updateSGStats];
            break;
        case 6:
            DefReb++;
            self.sgDefReb.text=[NSString stringWithFormat:@"%d",DefReb];
            [self updateSGStats];
            break;
        case 7:
            OffReb++;
            self.sgOffReb.text=[NSString stringWithFormat:@"%d",OffReb];
            [self updateSGStats];
            break;
        case 8:
            AST++;
            self.sgAST.text=[NSString stringWithFormat:@"%d",AST];
            [self updateSGStats];
            break;
        case 9:
            PersonalFouls++;
            self.sgPF.text=[NSString stringWithFormat:@"%d",PersonalFouls];
            [self updateSGStats];
            break;
        case 10:
            ST++;
            self.sgST.text=[NSString stringWithFormat:@"%d",ST];
            [self updateSGStats];
            break;
        case 11:
            TO++;
            self.sgTO.text=[NSString stringWithFormat:@"%d",TO];
            [self updateSGStats];
            break;
        case 12:
            BS++;
            self.sgBS.text=[NSString stringWithFormat:@"%d",BS];
            [self updateSGStats];
            break;
            
        default:
            break;
    }
    }
}
//將資料加入
-(void)addPGStats{

    for(int i=0;i<[self.PG count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.PG objectAtIndex:i];
        stats.statsPosition=@"PG";
        stats.statsFGA=self.pgFGA.text;
        stats.statsFGM=self.pgFGM.text;
        stats.stats3PA=self.pg3PA.text;
        stats.stats3PM=self.pg3PM.text;
        stats.statsFTA=self.pgFGA.text;
        stats.statsFTM=self.pgFTM.text;
        stats.statsDefReb=self.pgDefReb.text;
        stats.statsOffReb=self.pgOffReb.text;
        stats.statsAST=self.pgAST.text;
        stats.statsPF=self.pgPF.text;
        stats.statsST=self.pgST.text;
        stats.statsTO=self.pfTO.text;
        stats.statsBS=self.pgBS.text;
        [self.PGStats addObject:stats];
    }

    
}

-(void)addSGStats{

    for(int i=0;i<[self.SG count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.SG objectAtIndex:i];
        stats.statsPosition=@"SG";
        stats.statsFGA=self.sgFGA.text;
        stats.statsFGM=self.sgFGM.text;
        stats.stats3PA=self.sg3PA.text;
        stats.stats3PM=self.sg3PM.text;
        stats.statsFTA=self.sgFGA.text;
        stats.statsFTM=self.sgFTM.text;
        stats.statsDefReb=self.sgDefReb.text;
        stats.statsOffReb=self.sgOffReb.text;
        stats.statsAST=self.sgAST.text;
        stats.statsPF=self.sgPF.text;
        stats.statsST=self.sgST.text;
        stats.statsTO=self.sfTO.text;
        stats.statsBS=self.sgBS.text;
        [self.SGStats addObject:stats];
    }
    
    
}

-(void)addSFStats{

    for(int i=0;i<[self.SF count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.SF objectAtIndex:i];
        stats.statsPosition=@"SF";
        stats.statsFGA=self.sfFGA.text;
        stats.statsFGM=self.sfFGM.text;
        stats.stats3PA=self.sf3PA.text;
        stats.stats3PM=self.sf3PM.text;
        stats.statsFTA=self.sfFGA.text;
        stats.statsFTM=self.sfFTM.text;
        stats.statsDefReb=self.sfDefReb.text;
        stats.statsOffReb=self.sfOffReb.text;
        stats.statsAST=self.sfAST.text;
        stats.statsPF=self.sfPF.text;
        stats.statsST=self.sfST.text;
        stats.statsTO=self.sfTO.text;
        stats.statsBS=self.sfBS.text;
        [self.SFStats addObject:stats];
    }
    
    
}

-(void)addPFStats{

    for(int i=0;i<[self.PF count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.PF objectAtIndex:i];
        stats.statsPosition=@"PF";
        stats.statsFGA=self.pfFGA.text;
        stats.statsFGM=self.pfFGM.text;
        stats.stats3PA=self.pf3PA.text;
        stats.stats3PM=self.pf3PM.text;
        stats.statsFTA=self.pfFGA.text;
        stats.statsFTM=self.pfFTM.text;
        stats.statsDefReb=self.pfDefReb.text;
        stats.statsOffReb=self.pfOffReb.text;
        stats.statsAST=self.pfAST.text;
        stats.statsPF=self.pfPF.text;
        stats.statsST=self.pfST.text;
        stats.statsTO=self.pfTO.text;
        stats.statsBS=self.pfBS.text;
        [self.PFStats addObject:stats];
    }
    
    
}

-(void)addCenterStats{

    for(int i=0;i<[self.Center count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.Center objectAtIndex:i];
        stats.statsPosition=@"Center";
        stats.statsFGA=self.centerFGA.text;
        stats.statsFGM=self.centerFGM.text;
        stats.stats3PA=self.center3PA.text;
        stats.stats3PM=self.center3PM.text;
        stats.statsFTA=self.centerFGA.text;
        stats.statsFTM=self.centerFTM.text;
        stats.statsDefReb=self.centerDefReb.text;
        stats.statsOffReb=self.centerOffReb.text;
        stats.statsAST=self.centerAST.text;
        stats.statsPF=self.centerPF.text;
        stats.statsST=self.centerST.text;
        stats.statsTO=self.centerTO.text;
        stats.statsBS=self.centerBS.text;
        [self.CenterStats addObject:stats];
    }
    
    
}



-(IBAction)backButtonClicked:(id)sender{
    //[self dismissModalViewControllerAnimated:YES];
    //Delete File
        NSFileManager *manager=[NSFileManager defaultManager];
        [manager removeItemAtPath:[self statsFilePath] error:NULL];


}

-(void)updatePGStats{
    playerStats *stats=[self.PGStats objectAtIndex:indexPG];

    stats.statsFGA=self.pgFGA.text;
    stats.statsFGM=self.pgFGM.text;
    stats.stats3PA=self.pg3PA.text;
    stats.stats3PM=self.pg3PM.text;
    stats.statsFTA=self.pgFTA.text;
    stats.statsFTM=self.pgFTM.text;
    stats.statsDefReb=self.pgDefReb.text;
    stats.statsOffReb=self.pgOffReb.text;
    stats.statsAST=self.pgAST.text;
    stats.statsPF=self.pgPF.text;
    stats.statsST=self.pgST.text;
    stats.statsTO=self.pgTO.text;
    stats.statsBS=self.pgBS.text;
    
}

-(void)updateSGStats{
    playerStats *stats=[self.SGStats objectAtIndex:indexSG];
    
    stats.statsFGA=self.sgFGA.text;
    stats.statsFGM=self.sgFGM.text;
    stats.stats3PA=self.sg3PA.text;
    stats.stats3PM=self.sg3PM.text;
    stats.statsFTA=self.sgFTA.text;
    stats.statsFTM=self.sgFTM.text;
    stats.statsDefReb=self.sgDefReb.text;
    stats.statsOffReb=self.sgOffReb.text;
    stats.statsAST=self.sgAST.text;
    stats.statsPF=self.sgPF.text;
    stats.statsST=self.sgST.text;
    stats.statsTO=self.sgTO.text;
    stats.statsBS=self.sgBS.text;
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


    [self saveStats];
    //Share Object
    modalViewController.PGStats=self.PGStats;
    modalViewController.SGStats=self.SGStats;
    //modalViewController.SFStats=self.SFStats;
    
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
