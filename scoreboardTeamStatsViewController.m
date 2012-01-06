//
//  scoreboardTeamStatsViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardTeamStatsViewController.h"


@implementation scoreboardTeamStatsViewController
@synthesize statsModeControl;
@synthesize scrollView;
@synthesize PGStats, SGStats, SFStats, PFStats, CenterStats;

@synthesize labelPoints, labelFG, labelFGPercent, label3P, label3PPercent, labelFT, labelFTPercent, labelOffReb, labelTotalReb, labelAssists, labelFouls, labelSteals, labelTurnouvers, labelBlocks, Score;

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
    [self setTeamStats];
    [self calculateTeamStats];
    [self showTeamStats];
    

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
    teamPoints=FGM*2+_3PM;//三分球也算是Field Goal
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

-(IBAction)changeStatsMode:(id)sender{
    if(self.statsModeControl.selectedSegmentIndex==0){
//        scoreboardPlayerStatsViewController *modalViewController=[[scoreboardPlayerStatsViewController alloc]initWithNibName:@"scoreboardPlayerStatsViewController" bundle:nil];
//        [self presentModalViewController:modalViewController animated:NO];
        scoreboardPlayerStatsViewController *i=[[scoreboardPlayerStatsViewController alloc]init];
        i.statsModeControl.selectedSegmentIndex=self.statsModeControl.selectedSegmentIndex;
        [self dismissModalViewControllerAnimated:NO];


    }
}

-(IBAction)backButtonClicked:(id)sender{
    if(self.statsModeControl.selectedSegmentIndex==1){
    scoreboardStatisticViewController *modalViewController=[[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
    [self presentModalViewController:modalViewController animated:YES];
    }
}

@end
