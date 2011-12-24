//
//  scoreboardOptionPageViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardOptionPageViewController.h"
#import "scoreboardOptionCustomViewController.h"

@implementation scoreboardOptionPageViewController
@synthesize nbaButton;
@synthesize fibaButton;
@synthesize ncaaButton;
@synthesize customButton;
@synthesize gameMode;
@synthesize delegate;

@synthesize fiba;
@synthesize nba;
@synthesize ncaa;
@synthesize custom;

@synthesize test;

@synthesize save;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        fiba=[NSDictionary dictionaryWithObjectsAndKeys:@"600",@"time",@"4",@"foul",@"4",@"period",@"5",@"tol",nil];
        nba=[NSDictionary dictionaryWithObjectsAndKeys:@"720",@"time",@"4",@"foul",@"4",@"period",@"8",@"tol" ,nil];
        ncaa=[NSDictionary dictionaryWithObjectsAndKeys:@"1200",@"time",@"6",@"foul",@"2",@"period",@"6",@"tol" ,nil];
        
        
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
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    gameMode=[defaults objectForKey:@"gameMode"];
    [self loadGameMode:gameMode];
    
    
    [[save layer]setBorderWidth:2.0f];
    [[save layer]setCornerRadius:8.0f];
    [[save layer]setBorderColor:[UIColor whiteColor].CGColor];
    

    

    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewDidDisappear:(BOOL)animated{

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

-(void)loadGameMode:(NSString*)GameMode{
    if([gameMode isEqualToString:@"fiba"] ){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [fibaButton setImage:imgOn forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        
        
    }
    
    if([gameMode isEqualToString:@"nba"]){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [nbaButton setImage:imgOn forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        
    }
    
    if([gameMode isEqualToString:@"ncaa"]){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [ncaaButton setImage:imgOn forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        
    }
    if([gameMode isEqualToString:@"custom"]){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [customButton setImage:imgOn forState:UIControlStateNormal]; 
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        
    }
}

-(IBAction)fibaButtonClicked:(id)sender{
    if(![gameMode isEqualToString:@"fiba"]){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [fibaButton setImage:imgOn forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        gameMode=@"fiba";

    }
}

-(IBAction)nbaButtonClicked:(id)sender{
    
    if(![gameMode isEqualToString:@"nba"]){
    UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
    UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
    [nbaButton setImage:imgOn forState:UIControlStateNormal];
    [fibaButton setImage:imgOff forState:UIControlStateNormal];
    [ncaaButton setImage:imgOff forState:UIControlStateNormal];
    [customButton setImage:imgOff forState:UIControlStateNormal];
    self.gameMode=@"nba";

    }
    
}



-(IBAction)ncaaButtonClicked:(id)sender{
    if(![gameMode isEqualToString:@"ncaa"]){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [ncaaButton setImage:imgOn forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        gameMode=@"ncaa";

    }
}

-(IBAction)customButtonClicked:(id)sender{
    scoreboardOptionCustomViewController *modalViewController=[[scoreboardOptionCustomViewController alloc]initWithNibName:@"scoreboardOptionCustomViewController" bundle:nil];
    modalViewController.delegate=self;
    [self presentModalViewController:modalViewController animated:YES];
    
    if(![gameMode isEqual:@"custom"]){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [customButton setImage:imgOn forState:UIControlStateNormal]; 
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        gameMode=@"custom";

    }
    
    
}


-(IBAction)backButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)setCustomMode:(NSDictionary*)customData{
    custom =[NSDictionary dictionaryWithDictionary:customData];
}

-(IBAction)saveButtonClicked:(id)sender{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:gameMode forKey:@"gameMode"];
    if([gameMode isEqualToString:@"fiba"]){
        [delegate modeSelected:fiba]; 
    }
    if([gameMode isEqualToString:@"nba"]){
        [delegate modeSelected:nba];
    }
    if([gameMode isEqualToString:@"ncaa"]){
        [delegate modeSelected:ncaa]; 
    }
    if([gameMode isEqualToString:@"custom"]){
        [delegate modeSelected:custom];
    }




}




@end
