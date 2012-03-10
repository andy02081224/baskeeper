//
//  scoreboardTeamStatsViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//


#import "teamGamePageVIewController.h"
#import "teamMainPageViewController.h"
#import "scoreboardPlayerStatsViewController.h"
#import "scoreboardStatisticViewController.h"
#import "playerStats.h"
#import "scoreboardTeamStatsViewController.h"
#import "AddThis.h"

@implementation scoreboardTeamStatsViewController
@synthesize statsModeControl;
@synthesize scrollView;
@synthesize PGStats, SGStats, SFStats, PFStats, CenterStats;
@synthesize statsTable;
@synthesize gameMode;
@synthesize teamName;
@synthesize saveButton;
@synthesize opponentScoreField;
@synthesize opponentNameField;
@synthesize delegate;

@synthesize labelPoints, labelFG, labelFGPercent, label3P, label3PPercent, labelFT, labelFTPercent, labelOffReb, labelTotalReb, labelAssists, labelFouls, labelSteals, labelTurnouvers, labelBlocks, Score, team;

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
    self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*1.55);
    
    self.team.text=self.teamName;
    
    [self setTeamStats];
    [self calculateTeamStats];
    [self showTeamStats];
    
    [AddThisSDK setFacebookAuthenticationMode:ATFacebookAuthenticationTypeFBConnect];
    [AddThisSDK setFacebookAPIKey:@"155431987899543"];
    [AddThisSDK setFavoriteMenuServices:@"facebook",nil];
    
    if ([self.gameMode isEqualToString:@"team"]) {
        saveButton.hidden=NO;
    }
    

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

-(void)setTeamStats{
    //PG
    for (int i=0; i<[self.PGStats count]; i++) {
        playerStats *stats=[self.PGStats objectAtIndex:i];
        FGA+=[stats.statsFGA floatValue];
        FGM+=[stats.statsFGM floatValue];
        _3PA+=[stats.stats3PA floatValue];
        _3PM+=[stats.stats3PM floatValue];
        FTA+=[stats.statsFTA floatValue];
        FTM+=[stats.statsFTM floatValue];
        DefReb+=[stats.statsDefReb intValue];
        OffReb+=[stats.statsOffReb intValue];
        assists+=[stats.statsAST intValue];
        fouls+=[stats.statsPF intValue];
        steals+=[stats.statsST intValue];
        turnovers+=[stats.statsTO intValue];
        blocks+=[stats.statsBS intValue];
    }
    
    //SG
    for (int i=0; i<[self.SGStats count]; i++) {
        playerStats *stats=[self.SGStats objectAtIndex:i];
        FGA+=[stats.statsFGA floatValue];
        FGM+=[stats.statsFGM floatValue];
        _3PA+=[stats.stats3PA floatValue];
        _3PM+=[stats.stats3PM floatValue];
        FTA+=[stats.statsFTA floatValue];
        FTM+=[stats.statsFTM floatValue];
        DefReb+=[stats.statsDefReb intValue];
        OffReb+=[stats.statsOffReb intValue];
        assists+=[stats.statsAST intValue];
        fouls+=[stats.statsPF intValue];
        steals+=[stats.statsST intValue];
        turnovers+=[stats.statsTO intValue];
        blocks+=[stats.statsBS intValue];
    }
    
    //SF
    for (int i=0; i<[self.SFStats count]; i++) {
        playerStats *stats=[self.SFStats objectAtIndex:i];
        FGA+=[stats.statsFGA floatValue];
        FGM+=[stats.statsFGM floatValue];
        _3PA+=[stats.stats3PA floatValue];
        _3PM+=[stats.stats3PM floatValue];
        FTA+=[stats.statsFTA floatValue];
        FTM+=[stats.statsFTM floatValue];
        DefReb+=[stats.statsDefReb intValue];
        OffReb+=[stats.statsOffReb intValue];
        assists+=[stats.statsAST intValue];
        fouls+=[stats.statsPF intValue];
        steals+=[stats.statsST intValue];
        turnovers+=[stats.statsTO intValue];
        blocks+=[stats.statsBS intValue];
    }
    
    //PF
    for (int i=0; i<[self.PFStats count]; i++) {
        playerStats *stats=[self.PFStats objectAtIndex:i];
        FGA+=[stats.statsFGA floatValue];
        FGM+=[stats.statsFGM floatValue];
        _3PA+=[stats.stats3PA floatValue];
        _3PM+=[stats.stats3PM floatValue];
        FTA+=[stats.statsFTA floatValue];
        FTM+=[stats.statsFTM floatValue];
        DefReb+=[stats.statsDefReb intValue];
        OffReb+=[stats.statsOffReb intValue];
        assists+=[stats.statsAST intValue];
        fouls+=[stats.statsPF intValue];
        steals+=[stats.statsST intValue];
        turnovers+=[stats.statsTO intValue];
        blocks+=[stats.statsBS intValue];
    }
    
    //Center
    for (int i=0; i<[self.CenterStats count]; i++) {
        playerStats *stats=[self.CenterStats objectAtIndex:i];
        FGA+=[stats.statsFGA floatValue];
        FGM+=[stats.statsFGM floatValue];
        _3PA+=[stats.stats3PA floatValue];
        _3PM+=[stats.stats3PM floatValue];
        FTA+=[stats.statsFTA floatValue];
        FTM+=[stats.statsFTM floatValue];
        DefReb+=[stats.statsDefReb intValue];
        OffReb+=[stats.statsOffReb intValue];
        assists+=[stats.statsAST intValue];
        fouls+=[stats.statsPF intValue];
        steals+=[stats.statsST intValue];
        turnovers+=[stats.statsTO intValue];
        blocks+=[stats.statsBS intValue];
    }
}

-(void)calculateTeamStats{
    teamPoints=FGM*2+_3PM+FTM;//三分球也算是Field Goal
    if(FGA>0){
    teamFGPercent=FGM/FGA*100;
    }
    if(_3PA>0){
    team3PPercent=_3PM/_3PA*100;
    }
    if(FTA>0){
    teamFTPercent=FTM/FTA*100;
    }
    teamTotalReb=OffReb+DefReb;
}

-(void)showTeamStats{

    self.labelPoints.text=[NSString stringWithFormat:@"%d",teamPoints];
    self.labelFG.text=[NSString stringWithFormat:@"%.0f/%.0f",FGM,FGA];
    self.labelFGPercent.text=[NSString stringWithFormat:@"%.1f%%",teamFGPercent];
    self.label3P.text=[NSString stringWithFormat:@"%.0f/%.0f",_3PM,_3PA];
    self.label3PPercent.text=[NSString stringWithFormat:@"%.1f%%",team3PPercent];
    self.labelFT.text=[NSString stringWithFormat:@"%.0f/%.0f",FTM,FTA];
    self.labelFTPercent.text=[NSString stringWithFormat:@"%.1f%%",teamFTPercent];
    self.labelOffReb.text=[NSString stringWithFormat:@"%d",OffReb];
    self.labelTotalReb.text=[NSString stringWithFormat:@"%d",teamTotalReb];
    self.labelAssists.text=[NSString stringWithFormat:@"%d",assists];
    self.labelFouls.text=[NSString stringWithFormat:@"%d",fouls];
    self.labelSteals.text=[NSString stringWithFormat:@"%d",steals];
    self.labelTurnouvers.text=[NSString stringWithFormat:@"%d",turnovers];
    self.labelBlocks.text=[NSString stringWithFormat:@"%d",blocks];
    self.Score.text=[NSString stringWithFormat:@"%d",teamPoints];
    
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//}



-(IBAction)changeStatsMode:(id)sender{
    if(self.statsModeControl.selectedSegmentIndex==0){
//        scoreboardPlayerStatsViewController *modalViewController=[[scoreboardPlayerStatsViewController alloc]initWithNibName:@"scoreboardPlayerStatsViewController" bundle:nil];
//        [self presentModalViewController:modalViewController animated:NO];

        [self dismissModalViewControllerAnimated:NO];


    }
}

-(IBAction)backButtonClicked:(id)sender{
    if(self.statsModeControl.selectedSegmentIndex==1){
    scoreboardStatisticViewController *modalViewController=[[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
    [self presentModalViewController:modalViewController animated:YES];
    }
    if(self.statsModeControl.selectedSegmentIndex==2){
        //Using AddThis SDK
        [AddThisSDK shareURL:@"www.baskeeper.com" withService:@"facebook" title:[NSString stringWithFormat:@"Score:%@      REB(OFF):%@(%@)      AST:%@        ST:%@        BS:%@",self.Score.text,self.labelTotalReb.text,self.labelOffReb.text,self.labelAssists.text,self.labelSteals.text,self.labelBlocks.text] description:[NSString stringWithFormat:@"FG%%:%@      3P%%:%@      FT%%:%@      Fouls:%@      TO:%@",self.labelFGPercent.text,self.label3PPercent.text,self.labelFTPercent.text,self.labelFouls.text,self.labelTurnouvers.text]];
        
        //[NSString stringWithFormat:@"%@\n%@",self.label3P.text,self.label3PPercent.text]
    }
}

-(IBAction)saveButtonClicked:(id)sender{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Enter Opponent Info" message:@"\n\n\n" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Save", nil];

    self.opponentNameField=[[UITextField alloc]initWithFrame:CGRectMake(12, 30, 260, 25)];
    [self.opponentNameField setBackgroundColor:[UIColor whiteColor]];
    [self.opponentNameField setPlaceholder:@"Opponent Name"];
    [self.opponentNameField setKeyboardType:UIKeyboardTypeNamePhonePad];
    
    self.opponentScoreField=[[UITextField alloc]initWithFrame:CGRectMake(12, 65, 260, 25)];
    [self.opponentScoreField setBackgroundColor:[UIColor whiteColor]];
    [self.opponentScoreField setPlaceholder:@"Opponent Points"];
    [self.opponentScoreField setKeyboardType:UIKeyboardTypeNumberPad];
        
    [alert addSubview:self.opponentNameField];
    [alert addSubview:self.opponentScoreField];

    [alert show];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        Game *game=[[Game alloc]init];
        NSString *strDate;
        NSString *strResults;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        strDate = [dateFormatter stringFromDate:[NSDate date]];
        
        int opponentScore=[self.opponentScoreField.text intValue];
        if (opponentScore<teamPoints) {
            strResults=@"win";
        }
        else if(opponentScore==teamPoints){
            strResults=@"tie";
        }
        else{
            strResults=@"lose";
        }
        
        game.gameDate=strDate;
        game.opponentName=self.opponentNameField.text;
        game.opponentScore=self.opponentScoreField.text;
        game.gameResults=strResults;

        teamMainPageViewController *teamViewController=[[teamMainPageViewController alloc]initWithStyle:UITableViewStyleGrouped];
 
        UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:teamViewController];
        [navController  setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentModalViewController:navController animated:YES];
        
    }
}

-(IBAction)shareClicked:(id)sender{
//    if (self.statsModeControl.selectedSegmentIndex==2) {
//        
//        UIImage* image = nil;
//        
//        UIGraphicsBeginImageContext(self.scrollView.contentSize);
//        {   //截圖
//            CGPoint savedContentOffset = self.scrollView.contentOffset;
//            CGRect savedFrame = self.scrollView.frame;
//            
//            self.scrollView.contentOffset = CGPointZero;
//            self.scrollView.frame = CGRectMake(0, 0,self.scrollView.contentSize.width,self.scrollView.contentSize.height);
//            
//            [self.scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];     
//            image = UIGraphicsGetImageFromCurrentImageContext();
//            
//            self.scrollView.contentOffset = savedContentOffset;
//            self.scrollView.frame = savedFrame;
//        }
//        UIGraphicsEndImageContext();
//        //Using AddThis SDK
//        [AddThisSDK shareImage:image
//                   withService:@"facebook"
//                         title:@"www.baskeeper.com"   
//                   description:@""];
//        
//    }
    
}

@end
