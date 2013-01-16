//
//  scoreboardStatisticViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardStatisticViewController.h"
#import "MPFlipTransition.h"
#import "MPFlipEnumerations.h"


@implementation scoreboardStatisticViewController

@synthesize delegate;
@synthesize scrollView;
@synthesize gameMode;
@synthesize teamName;
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

@synthesize positionFromTeam;
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
        self.gameMode=@"scoreboard";
        self.teamName=@"Team";
        time=600;

        


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
    [self setPositionNumbersFromTeam];
    
    // Add swipe right recognizer
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeRightRecognizer];
    
}

- (void)swipeRight:(UISwipeGestureRecognizer *)recognizer
{
    [self.delegate updateScore:self.labelScore.text];
    [self.delegate updatePeriod:self.labelPeriod.text];
    [self.delegate dismissBoxView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self saveStats];
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

-(NSString*)PGFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirs objectAtIndex:0];
    // 回傳資料夾 + 檔案名稱
    return [docPath stringByAppendingPathComponent:@"PGStats.archivedObject"];
}

-(NSString*)SGFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirs objectAtIndex:0];
    // 回傳資料夾 + 檔案名稱
    return [docPath stringByAppendingPathComponent:@"SGStats.archivedObject"];
}

-(NSString*)SFFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirs objectAtIndex:0];
    // 回傳資料夾 + 檔案名稱
    return [docPath stringByAppendingPathComponent:@"SFStats.archivedObject"];  
}

-(NSString*)PFFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirs objectAtIndex:0];
    // 回傳資料夾 + 檔案名稱
    return [docPath stringByAppendingPathComponent:@"PFStats.archivedObject"];
}

-(NSString*)CenterFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirs objectAtIndex:0];
    // 回傳資料夾 + 檔案名稱
    return [docPath stringByAppendingPathComponent:@"CenterStats.archivedObject"];
}

-(void)loadStats{
    NSArray *pgStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self PGFilePath]];
    if(pgStats){
        self.PGStats=[pgStats mutableCopy];
        if([self.PGStats count]>0){
        [self loadPGStats];
        }

    }
    else{
        self.PGStats=[NSMutableArray array];
    }
    
    
    NSArray *sgStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self SGFilePath]];
    if(sgStats){
        self.SGStats=[sgStats mutableCopy];
        if([self.SGStats count]>0){
        [self loadSGStats];
        }

    }
    else{
        self.SGStats=[NSMutableArray array];
    }
    
    NSArray *sfStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self SFFilePath]];
    if(sfStats){
        self.SFStats=[sfStats mutableCopy];
        if([self.SFStats count]>0){
        [self loadSFStats];
        }
        
    }
    else{
        self.SFStats=[NSMutableArray array];
    }
    
    NSArray *pfStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self PFFilePath]];
    if(pfStats){
        
        self.PFStats=[pfStats mutableCopy];
        if([self.PFStats count]>0){
        [self loadPFStats];
        }
        
    }
    else{
        self.PFStats=[NSMutableArray array];
    }
    
    NSArray *centerStats=[NSKeyedUnarchiver unarchiveObjectWithFile:[self CenterFilePath]];
    if(centerStats){
        self.CenterStats=[centerStats mutableCopy];
        if([self.CenterStats count]>0){
        [self loadCenterStats];
        }
        
    }
    else{
        self.CenterStats=[NSMutableArray array];
    }
}

-(void)saveStats{
    [NSKeyedArchiver archiveRootObject:self.PGStats toFile:[self PGFilePath]];
    [NSKeyedArchiver archiveRootObject:self.SGStats toFile:[self SGFilePath]];
    [NSKeyedArchiver archiveRootObject:self.SFStats toFile:[self SFFilePath]];
    [NSKeyedArchiver archiveRootObject:self.PFStats toFile:[self PFFilePath]];
    [NSKeyedArchiver archiveRootObject:self.CenterStats toFile:[self CenterFilePath]];

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
            [self saveStats];
            //Share Object
            modalViewController.gameMode=self.gameMode;
            modalViewController.teamName=self.teamName;
            modalViewController.PGStats=self.PGStats;
            modalViewController.SGStats=self.SGStats;
            modalViewController.SFStats=self.SFStats;
            modalViewController.PFStats=self.PFStats;
            modalViewController.CenterStats=self.CenterStats;
            [self presentModalViewController:modalViewController animated:YES];
            
            
            
            //畫面顯示搖動文字
//            mylabel.text=@"搖動";
            
            //設定２秒後自動還原                
//            [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(cleartext) userInfo:nil repeats:NO];
        }
    }
}                

-(void)setPositionNumbersFromTeam{
    if([self.positionFromTeam count]>0){
        [self deleteAllNumbers:nil];
        [self setPositionNumbers:self.positionFromTeam];
        self.gameMode=@"team";
    }
}

-(void)setPositionNumbers:(NSArray *)position{
    self.PG=[position objectAtIndex:0];
    self.SG=[position objectAtIndex:1];
    self.SF=[position objectAtIndex:2];
    self.PF=[position objectAtIndex:3];
    self.Center=[position objectAtIndex:4];
    

       
    if([self.PG count]>0){
        [self addPGStats];
        playerStats *stats=[self.PGStats objectAtIndex:indexPG];
        self.labelPG.text=stats.statsNumber;
    }
    if ([self.SG count]>0) {
        [self addSGStats];
        playerStats *stats=[self.SGStats objectAtIndex:indexSG];
        self.labelSG.text=stats.statsNumber;
    }
    if ([self.SF count]>0) {
        [self addSFStats];
        playerStats *stats=[self.SFStats objectAtIndex:indexSF];
        self.labelSF.text=stats.statsNumber;
    }
    if ([self.PF count]>0) {
        [self addPFStats];
        playerStats *stats=[self.PFStats objectAtIndex:indexPF];
        self.labelPF.text=stats.statsNumber;
    }
    if ([self.Center count]>0) {
        [self addCenterStats];
        playerStats *stats=[self.CenterStats objectAtIndex:indexCenter];
        self.labelCenter.text=stats.statsNumber;
    }

    
    
}



-(IBAction)changePGNumbers:(id)sender{
    if([self.PGStats count]>0){    
        indexPG++;

        if(indexPG<[self.PGStats count]){
            [self loadPGStats];
            
        }
        else{
        indexPG=0;
            [self loadPGStats];       
        }
        
        
    }
}

-(IBAction)changeSGNumbers:(id)sender{
    if([self.SGStats count]>0){
        indexSG++;
        if(indexSG<[self.SGStats count]){
        
            [self loadSGStats];
        }
        else{
            indexSG=0;
            [self loadSGStats];        
        }
        

    }
}

-(IBAction)changeSFNumbers:(id)sender{
    if([self.SFStats count]>0){
        indexSF++;
        if(indexSF<[self.SFStats count]){
        
            [self loadSFStats];
        }
        else{
            indexSF=0;
            [self loadSFStats];        
        }
        

    }
}

-(IBAction)changePFNumbers:(id)sender{
    if([self.PFStats count]>0){
        indexPF++;
        if(indexPF<[self.PFStats count]){
        
            [self loadPFStats];
        }
        else{
            indexPF=0;
            [self loadPFStats];       
        }
        

    }
}

-(IBAction)changeCenterNumbers:(id)sender{
    if([self.CenterStats count]>0){
        indexCenter++;
        if(indexCenter<[self.CenterStats count]){
        
            [self loadCenterStats];
        }
        else{
            indexCenter=0;
            [self loadCenterStats];      
        }
        

    }
}


-(void)loadPGStats{
    playerStats *stats=[self.PGStats objectAtIndex:indexPG];
    self.labelPG.text=stats.statsNumber;
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
    self.labelSG.text=stats.statsNumber;
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
    self.labelSF.text=stats.statsNumber;
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
    self.labelPF.text=stats.statsNumber;
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
    self.labelCenter.text=stats.statsNumber;
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
    [self presentViewController:modalViewController animated:YES completion:nil];
    //[(UIViewController *)[[[[self view] superview] superview] nextResponder] presentModalViewController:modalViewController animated:YES];
    
}

-(IBAction)changePeriod:(id)sender{
    self.labelPeriod.text=[NSString stringWithFormat:@"%.0f",periodControl.value];
}

-(IBAction)changePGStats:(id)sender{
    if([self.PGStats count]>0){
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
            [self updateScoreLabel:2];
            break;
        case 2:
            FGA++;
            _3PA++;
            self.pgFGA.text=[NSString stringWithFormat:@"%d",FGA];
            self.pg3PA.text=[NSString stringWithFormat:@"%d",_3PA];
            [self updatePGStats];
            break;
        case 3:
            FGM++;
            _3PM++;
            self.pgFGM.text=[NSString stringWithFormat:@"%d",FGM];
            self.pg3PM.text=[NSString stringWithFormat:@"%d",_3PM];
            [self updatePGStats];
            [self updateScoreLabel:3];
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
            [self updateScoreLabel:1];
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
    if([self.SGStats count]>0){
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
            [self updateScoreLabel:2];
            break;
        case 2:
            FGA++;
            _3PA++;
            self.sgFGA.text=[NSString stringWithFormat:@"%d",FGA];
            self.sg3PA.text=[NSString stringWithFormat:@"%d",_3PA];
            [self updateSGStats];
            break;
        case 3:
            FGM++;
            _3PM++;
            self.sgFGA.text=[NSString stringWithFormat:@"%d",FGM];
            self.sg3PM.text=[NSString stringWithFormat:@"%d",_3PM];
            [self updateSGStats];
            [self updateScoreLabel:3];
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
            [self updateScoreLabel:1];
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

-(IBAction)changeSFStats:(id)sender{
    if([self.SFStats count]>0){
        UIButton *button=(UIButton*)sender;
        int index=button.tag;
        
        //Get current values
        int FGA=[self.sfFGA.text intValue];
        int FGM=[self.sfFGM.text intValue];
        int _3PA=[self.sf3PA.text intValue];
        int _3PM=[self.sf3PM.text intValue];
        int FTM=[self.sfFTM.text intValue];
        int FTA=[self.sfFTA.text intValue];
        int DefReb=[self.sfDefReb.text intValue];
        int OffReb=[self.sfOffReb.text intValue];
        int AST=[self.sfAST.text intValue];
        int PersonalFouls=[self.sfPF.text intValue];
        int ST=[self.sfST.text intValue];
        int TO=[self.sfTO.text intValue];
        int BS=[self.sfBS.text intValue];
        
        switch (index) {
            case 0:
                FGA++;
                self.sfFGA.text=[NSString stringWithFormat:@"%d",FGA];
                [self updateSFStats];
                break;
            case 1:
                FGM++;
                self.sfFGM.text=[NSString stringWithFormat:@"%d",FGM];
                [self updateSFStats];
                [self updateScoreLabel:2];
                break;
            case 2:
                FGA++;
                _3PA++;
                self.sfFGA.text=[NSString stringWithFormat:@"%d",FGA];
                self.sf3PA.text=[NSString stringWithFormat:@"%d",_3PA];
                [self updateSFStats];
                break;
            case 3:
                FGM++;
                _3PM++;
                self.sfFGM.text=[NSString stringWithFormat:@"%d",FGM];
                self.sf3PM.text=[NSString stringWithFormat:@"%d",_3PM];
                [self updateSFStats];
                [self updateScoreLabel:3];
                break;
            case 4:
                FTA++;
                self.sfFTA.text=[NSString stringWithFormat:@"%d",FTA];
                [self updateSFStats];
                break;
            case 5:
                FTM++;
                self.sfFTM.text=[NSString stringWithFormat:@"%d",FTM];
                [self updateSFStats];
                [self updateScoreLabel:1];
                break;
            case 6:
                DefReb++;
                self.sfDefReb.text=[NSString stringWithFormat:@"%d",DefReb];
                [self updateSFStats];
                break;
            case 7:
                OffReb++;
                self.sfOffReb.text=[NSString stringWithFormat:@"%d",OffReb];
                [self updateSFStats];
                break;
            case 8:
                AST++;
                self.sfAST.text=[NSString stringWithFormat:@"%d",AST];
                [self updateSFStats];
                break;
            case 9:
                PersonalFouls++;
                self.sfPF.text=[NSString stringWithFormat:@"%d",PersonalFouls];
                [self updateSFStats];
                break;
            case 10:
                ST++;
                self.sfST.text=[NSString stringWithFormat:@"%d",ST];
                [self updateSFStats];
                break;
            case 11:
                TO++;
                self.sfTO.text=[NSString stringWithFormat:@"%d",TO];
                [self updateSFStats];
                break;
            case 12:
                BS++;
                self.sfBS.text=[NSString stringWithFormat:@"%d",BS];
                [self updateSFStats];
                break;
                
            default:
                break;
        }  
    }
}

-(IBAction)changePFStats:(id)sender{
    if([self.PFStats count]>0){
        UIButton *button=(UIButton*)sender;
        int index=button.tag;
        
        //Get current values
        int FGA=[self.pfFGA.text intValue];
        int FGM=[self.pfFGM.text intValue];
        int _3PA=[self.pf3PA.text intValue];
        int _3PM=[self.pf3PM.text intValue];
        int FTM=[self.pfFTM.text intValue];
        int FTA=[self.pfFTA.text intValue];
        int DefReb=[self.pfDefReb.text intValue];
        int OffReb=[self.pfOffReb.text intValue];
        int AST=[self.pfAST.text intValue];
        int PersonalFouls=[self.pfPF.text intValue];
        int ST=[self.pfST.text intValue];
        int TO=[self.pfTO.text intValue];
        int BS=[self.pfBS.text intValue];
        
        switch (index) {
            case 0:
                FGA++;
                self.pfFGA.text=[NSString stringWithFormat:@"%d",FGA];
                [self updatePFStats];
                break;
            case 1:
                FGM++;
                self.pfFGM.text=[NSString stringWithFormat:@"%d",FGM];
                [self updatePFStats];
                [self updateScoreLabel:2];
                break;
            case 2:
                FGA++;
                _3PA++;
                self.pfFGA.text=[NSString stringWithFormat:@"%d",FGA];
                self.pf3PA.text=[NSString stringWithFormat:@"%d",_3PA];
                [self updatePFStats];
                break;
            case 3:
                FGM++;
                _3PM++;
                self.pfFGM.text=[NSString stringWithFormat:@"%d",FGM];
                self.pf3PM.text=[NSString stringWithFormat:@"%d",_3PM];
                [self updatePFStats];
                [self updateScoreLabel:3];
                break;
            case 4:
                FTA++;
                self.pfFTA.text=[NSString stringWithFormat:@"%d",FTA];
                [self updatePFStats];
                break;
            case 5:
                FTM++;
                self.pfFTM.text=[NSString stringWithFormat:@"%d",FTM];
                [self updatePFStats];
                [self updateScoreLabel:1];
                break;
            case 6:
                DefReb++;
                self.pfDefReb.text=[NSString stringWithFormat:@"%d",DefReb];
                [self updatePFStats];
                break;
            case 7:
                OffReb++;
                self.pfOffReb.text=[NSString stringWithFormat:@"%d",OffReb];
                [self updatePFStats];
                break;
            case 8:
                AST++;
                self.pfAST.text=[NSString stringWithFormat:@"%d",AST];
                [self updatePFStats];
                break;
            case 9:
                PersonalFouls++;
                self.pfPF.text=[NSString stringWithFormat:@"%d",PersonalFouls];
                [self updatePFStats];
                break;
            case 10:
                ST++;
                self.pfST.text=[NSString stringWithFormat:@"%d",ST];
                [self updatePFStats];
                break;
            case 11:
                TO++;
                self.pfTO.text=[NSString stringWithFormat:@"%d",TO];
                [self updatePFStats];
                break;
            case 12:
                BS++;
                self.pfBS.text=[NSString stringWithFormat:@"%d",BS];
                [self updatePFStats];
                break;
                
            default:
                break;
        } 
    }
}

-(IBAction)changeCenterStats:(id)sender{
    if([self.CenterStats count]>0){
        UIButton *button=(UIButton*)sender;
        int index=button.tag;
        
        //Get current values
        int FGA=[self.centerFGA.text intValue];
        int FGM=[self.centerFGM.text intValue];
        int _3PA=[self.center3PA.text intValue];
        int _3PM=[self.center3PM.text intValue];
        int FTM=[self.centerFTM.text intValue];
        int FTA=[self.centerFTA.text intValue];
        int DefReb=[self.centerDefReb.text intValue];
        int OffReb=[self.centerOffReb.text intValue];
        int AST=[self.centerAST.text intValue];
        int PersonalFouls=[self.centerPF.text intValue];
        int ST=[self.centerST.text intValue];
        int TO=[self.centerTO.text intValue];
        int BS=[self.centerBS.text intValue];
        
        switch (index) {
            case 0:
                FGA++;
                self.centerFGA.text=[NSString stringWithFormat:@"%d",FGA];
                [self updateCenterStats];
                break;
            case 1:
                FGM++;
                self.centerFGM.text=[NSString stringWithFormat:@"%d",FGM];
                [self updateCenterStats];
                [self updateScoreLabel:2];
                break;
            case 2:
                FGA++;
                _3PA++;
                self.centerFGA.text=[NSString stringWithFormat:@"%d",FGA];
                self.center3PA.text=[NSString stringWithFormat:@"%d",_3PA];
                [self updateCenterStats];
                break;
            case 3:
                FGM++;
                _3PM++;
                self.centerFGM.text=[NSString stringWithFormat:@"%d",FGM];
                self.center3PM.text=[NSString stringWithFormat:@"%d",_3PM];
                [self updateCenterStats];
                [self updateScoreLabel:3];
                break;
            case 4:
                FTA++;
                self.centerFTA.text=[NSString stringWithFormat:@"%d",FTA];
                [self updateCenterStats];
                break;
            case 5:
                FTM++;
                self.centerFTM.text=[NSString stringWithFormat:@"%d",FTM];
                [self updateCenterStats];
                [self updateScoreLabel:1];
                break;
            case 6:
                DefReb++;
                self.centerDefReb.text=[NSString stringWithFormat:@"%d",DefReb];
                [self updateCenterStats];
                break;
            case 7:
                OffReb++;
                self.centerOffReb.text=[NSString stringWithFormat:@"%d",OffReb];
                [self updateCenterStats];
                break;
            case 8:
                AST++;
                self.centerAST.text=[NSString stringWithFormat:@"%d",AST];
                [self updateCenterStats];
                break;
            case 9:
                PersonalFouls++;
                self.centerPF.text=[NSString stringWithFormat:@"%d",PersonalFouls];
                [self updateCenterStats];
                break;
            case 10:
                ST++;
                self.centerST.text=[NSString stringWithFormat:@"%d",ST];
                [self updateCenterStats];
                break;
            case 11:
                TO++;
                self.centerTO.text=[NSString stringWithFormat:@"%d",TO];
                [self updateCenterStats];
                break;
            case 12:
                BS++;
                self.centerBS.text=[NSString stringWithFormat:@"%d",BS];
                [self updateCenterStats];
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
        stats.statsFGA=@"0";
        stats.statsFGM=@"0";
        stats.stats3PA=@"0";
        stats.stats3PM=@"0";
        stats.statsFTA=@"0";
        stats.statsFTM=@"0";
        stats.statsDefReb=@"0";
        stats.statsOffReb=@"0";
        stats.statsAST=@"0";
        stats.statsPF=@"0";
        stats.statsST=@"0";
        stats.statsTO=@"0";
        stats.statsBS=@"0";
        [self.PGStats addObject:stats];
    }

    
}

-(void)addSGStats{

    for(int i=0;i<[self.SG count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.SG objectAtIndex:i];
        stats.statsPosition=@"SG";
        stats.statsFGA=@"0";
        stats.statsFGM=@"0";
        stats.stats3PA=@"0";
        stats.stats3PM=@"0";
        stats.statsFTA=@"0";
        stats.statsFTM=@"0";
        stats.statsDefReb=@"0";
        stats.statsOffReb=@"0";
        stats.statsAST=@"0";
        stats.statsPF=@"0";
        stats.statsST=@"0";
        stats.statsTO=@"0";
        stats.statsBS=@"0";
        [self.SGStats addObject:stats];
    }
    
    
}

-(void)addSFStats{

    for(int i=0;i<[self.SF count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.SF objectAtIndex:i];
        stats.statsPosition=@"SF";
        stats.statsFGA=@"0";
        stats.statsFGM=@"0";
        stats.stats3PA=@"0";
        stats.stats3PM=@"0";
        stats.statsFTA=@"0";
        stats.statsFTM=@"0";
        stats.statsDefReb=@"0";
        stats.statsOffReb=@"0";
        stats.statsAST=@"0";
        stats.statsPF=@"0";
        stats.statsST=@"0";
        stats.statsTO=@"0";
        stats.statsBS=@"0";
        [self.SFStats addObject:stats];
    }
    
    
}

-(void)addPFStats{

    for(int i=0;i<[self.PF count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.PF objectAtIndex:i];
        stats.statsPosition=@"PF";
        stats.statsFGA=@"0";
        stats.statsFGM=@"0";
        stats.stats3PA=@"0";
        stats.stats3PM=@"0";
        stats.statsFTA=@"0";
        stats.statsFTM=@"0";
        stats.statsDefReb=@"0";
        stats.statsOffReb=@"0";
        stats.statsAST=@"0";
        stats.statsPF=@"0";
        stats.statsST=@"0";
        stats.statsTO=@"0";
        stats.statsBS=@"0";
        [self.PFStats addObject:stats];
    }
    
    
}

-(void)addCenterStats{

    for(int i=0;i<[self.Center count];i++){
        playerStats *stats=[[playerStats alloc]init];
        stats.statsNumber=[self.Center objectAtIndex:i];
        stats.statsPosition=@"Center";
        stats.statsFGA=@"0";
        stats.statsFGM=@"0";
        stats.stats3PA=@"0";
        stats.stats3PM=@"0";
        stats.statsFTA=@"0";
        stats.statsFTM=@"0";
        stats.statsDefReb=@"0";
        stats.statsOffReb=@"0";
        stats.statsAST=@"0";
        stats.statsPF=@"0";
        stats.statsST=@"0";
        stats.statsTO=@"0";
        stats.statsBS=@"0";
        [self.CenterStats addObject:stats];
    }
    
    
}



-(IBAction)backButtonClicked:(id)sender{
    scoreboardModeChoiceViewController *modalViewController=[[scoreboardModeChoiceViewController alloc]initWithNibName:@"scoreboardModeChoiceViewController" bundle:nil];
    [self presentModalViewController:modalViewController animated:YES];
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

-(void)updateSFStats{
    playerStats *stats=[self.SFStats objectAtIndex:indexSF];
    
    stats.statsFGA=self.sfFGA.text;
    stats.statsFGM=self.sfFGM.text;
    stats.stats3PA=self.sf3PA.text;
    stats.stats3PM=self.sf3PM.text;
    stats.statsFTA=self.sfFTA.text;
    stats.statsFTM=self.sfFTM.text;
    stats.statsDefReb=self.sfDefReb.text;
    stats.statsOffReb=self.sfOffReb.text;
    stats.statsAST=self.sfAST.text;
    stats.statsPF=self.sfPF.text;
    stats.statsST=self.sfST.text;
    stats.statsTO=self.sfTO.text;
    stats.statsBS=self.sfBS.text;
}

-(void)updatePFStats{
    playerStats *stats=[self.PFStats objectAtIndex:indexPF];
    
    stats.statsFGA=self.pfFGA.text;
    stats.statsFGM=self.pfFGM.text;
    stats.stats3PA=self.pf3PA.text;
    stats.stats3PM=self.pf3PM.text;
    stats.statsFTA=self.pfFTA.text;
    stats.statsFTM=self.pfFTM.text;
    stats.statsDefReb=self.pfDefReb.text;
    stats.statsOffReb=self.pfOffReb.text;
    stats.statsAST=self.pfAST.text;
    stats.statsPF=self.pfPF.text;
    stats.statsST=self.pfST.text;
    stats.statsTO=self.pfTO.text;
    stats.statsBS=self.pfBS.text;
}

-(void)updateCenterStats{
    playerStats *stats=[self.CenterStats objectAtIndex:indexCenter];
    
    stats.statsFGA=self.centerFGA.text;
    stats.statsFGM=self.centerFGM.text;
    stats.stats3PA=self.center3PA.text;
    stats.stats3PM=self.center3PM.text;
    stats.statsFTA=self.centerFTA.text;
    stats.statsFTM=self.centerFTM.text;
    stats.statsDefReb=self.centerDefReb.text;
    stats.statsOffReb=self.centerOffReb.text;
    stats.statsAST=self.centerAST.text;
    stats.statsPF=self.centerPF.text;
    stats.statsST=self.centerST.text;
    stats.statsTO=self.centerTO.text;
    stats.statsBS=self.centerBS.text;
}

- (void)updateScoreLabel:(int)score
{
    int currentScore = [self.labelScore.text intValue];
    currentScore += score;
    self.labelScore.text = [NSString stringWithFormat:@"%d", currentScore];
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
    modalViewController.gameMode=self.gameMode;
    modalViewController.teamName=self.teamName;
    modalViewController.PGStats=self.PGStats;
    modalViewController.SGStats=self.SGStats;
    modalViewController.SFStats=self.SFStats;
    modalViewController.PFStats=self.PFStats;
    modalViewController.CenterStats=self.CenterStats;

    
    [self presentModalViewController:modalViewController animated:YES];
}

-(IBAction)deleteAllNumbers:(id)sender{
    [self.PGStats removeAllObjects];
    [self.SGStats removeAllObjects];
    [self.SFStats removeAllObjects];
    [self.PFStats removeAllObjects];
    [self.CenterStats removeAllObjects];
    
    [self resetAllNumbers];
    [self saveStats];

    
}

-(void)resetAllNumbers{
    self.labelScore.text = @"0";
    
    self.labelPG.text=@"";
    self.labelSG.text=@"";
    self.labelSF.text=@"";
    self.labelPF.text=@"";
    self.labelCenter.text=@"";
    
    self.pgFGA.text=@"0";
    self.pgFGM.text=@"0";
    self.pg3PA.text=@"0";
    self.pg3PM.text=@"0";
    self.pgFTA.text=@"0";
    self.pgFTM.text=@"0";
    self.pgDefReb.text=@"0";
    self.pgOffReb.text=@"0";
    self.pgAST.text=@"0";
    self.pgPF.text=@"0";
    self.pgST.text=@"0";
    self.pgTO.text=@"0";
    self.pgBS.text=@"0";
    
    self.sgFGA.text=@"0";
    self.sgFGM.text=@"0";
    self.sg3PA.text=@"0";
    self.sg3PM.text=@"0";
    self.sgFTA.text=@"0";
    self.sgFTM.text=@"0";
    self.sgDefReb.text=@"0";
    self.sgOffReb.text=@"0";
    self.sgAST.text=@"0";
    self.sgPF.text=@"0";
    self.sgST.text=@"0";
    self.sgTO.text=@"0";
    self.sgBS.text=@"0";
    
    self.sfFGA.text=@"0";
    self.sfFGM.text=@"0";
    self.sf3PA.text=@"0";
    self.sf3PM.text=@"0";
    self.sfFTA.text=@"0";
    self.sfFTM.text=@"0";
    self.sfDefReb.text=@"0";
    self.sfOffReb.text=@"0";
    self.sfAST.text=@"0";
    self.sfPF.text=@"0";
    self.sfST.text=@"0";
    self.sfTO.text=@"0";
    self.sfBS.text=@"0";
    
    self.pfFGA.text=@"0";
    self.pfFGM.text=@"0";
    self.pf3PA.text=@"0";
    self.pf3PM.text=@"0";
    self.pfFTA.text=@"0";
    self.pfFTM.text=@"0";
    self.pfDefReb.text=@"0";
    self.pfOffReb.text=@"0";
    self.pfAST.text=@"0";
    self.pfPF.text=@"0";
    self.pfST.text=@"0";
    self.pfTO.text=@"0";
    self.pfBS.text=@"0";
    
    self.centerFGA.text=@"0";
    self.centerFGM.text=@"0";
    self.center3PA.text=@"0";
    self.center3PM.text=@"0";
    self.centerFTA.text=@"0";
    self.centerFTM.text=@"0";
    self.centerDefReb.text=@"0";
    self.centerOffReb.text=@"0";
    self.centerAST.text=@"0";
    self.centerPF.text=@"0";
    self.centerST.text=@"0";
    self.centerTO.text=@"0";
    self.centerBS.text=@"0";

    
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
