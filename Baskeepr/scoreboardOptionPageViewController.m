//
//  scoreboardOptionPageViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardOptionPageViewController.h"

@implementation scoreboardOptionPageViewController
@synthesize nbaButton;
@synthesize fibaButton;
@synthesize ncaaButton;
@synthesize customButton;
@synthesize gameMode;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //gameMode=@"fiba";
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
    [self setGameMode:gameMode];
    
    if(gameMode==@"fiba"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [fibaButton setImage:imgOn forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        
        
    }
    
    if(gameMode==@"nba"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [nbaButton setImage:imgOn forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        
    }
    
    if(gameMode==@"ncaa"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [ncaaButton setImage:imgOn forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        
    }
    if(gameMode==@"custom"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [customButton setImage:imgOn forState:UIControlStateNormal]; 
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        
    }
    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewDidDisappear:(BOOL)animated{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:gameMode forKey:@"gameMode"];
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

-(IBAction)fibaButtonClicked:(id)sender{
    if(gameMode!=@"fiba"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [fibaButton setImage:imgOn forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        gameMode=@"fiba";
                        [delegate modeSelected:0];
    }
}

-(IBAction)nbaButtonClicked:(id)sender{
    
    if(gameMode!=@"nba"){
    UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
    UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
    [nbaButton setImage:imgOn forState:UIControlStateNormal];
    [fibaButton setImage:imgOff forState:UIControlStateNormal];
    [ncaaButton setImage:imgOff forState:UIControlStateNormal];
    [customButton setImage:imgOff forState:UIControlStateNormal];
    gameMode=@"nba";
                [delegate modeSelected:1];
    }
    
}



-(IBAction)ncaaButtonClicked:(id)sender{
    if(gameMode!=@"ncaa"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [ncaaButton setImage:imgOn forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        [customButton setImage:imgOff forState:UIControlStateNormal];
        gameMode=@"ncaa";
                        [delegate modeSelected:2];
    }
}

-(IBAction)customButtonClicked:(id)sender{
    if(gameMode!=@"custom"){
        UIImage *imgOn=[UIImage imageNamed:@"radio-button_on-icons.png"];
        UIImage *imgOff=[UIImage imageNamed:@"radio-button_off-icons.png"];
        [customButton setImage:imgOn forState:UIControlStateNormal]; 
        [ncaaButton setImage:imgOff forState:UIControlStateNormal];
        [fibaButton setImage:imgOff forState:UIControlStateNormal];
        [nbaButton setImage:imgOff forState:UIControlStateNormal];
        gameMode=@"custom";
                        [delegate modeSelected:11];
    }
    
    
}


@end
