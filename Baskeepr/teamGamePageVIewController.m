//
//  teamGamePageVIewController.m
//  Baskeepr
//
//  Created by andy on 12/1/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "teamGamePageVIewController.h"

@implementation teamGamePageVIewController
@synthesize players, playerPG, playerSG, playerSF, playerPF, playerCenter;
@synthesize teams;
@synthesize games;
@synthesize delegate;



@synthesize test;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    self.title=@"Games"; 


    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGame:)];
    
    self.playerPG=[[NSMutableArray alloc]init];
    self.playerSG=[[NSMutableArray alloc]init];
    self.playerSF=[[NSMutableArray alloc]init];
    self.playerPF=[[NSMutableArray alloc]init];
    self.playerCenter=[[NSMutableArray alloc]init];
    
    [self setPositions];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...


    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)setPositions{
    for (int i=0; i<[self.players count]; i++) {
        
        Player *player=[self.players objectAtIndex:i];
        
        if([player.position isEqualToString:@"PG"]){
            [self.playerPG addObject:player.number];
        }
        if([player.position isEqualToString:@"SG"]){
            [self.playerSG addObject:player.number];
        }
        if([player.position isEqualToString:@"SF"]){
            [self.playerSF addObject:player.number];
        }
        if([player.position isEqualToString:@"PF"]){
            [self.playerPF addObject:player.number];
        }
        if([player.position isEqualToString:@"C"]){
            [self.playerCenter addObject:player.number];
        }
    }
}

-(void)addNewGame:(id)sender{
    
    
    
    if([self.players count]>0){
        
    scoreboardStatisticViewController *statsViewController=[[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
    NSArray *position=[NSArray arrayWithObjects:self.playerPG,self.playerSG,self.playerSF, self.playerPF, self.playerCenter, nil];
    statsViewController.positionFromTeam=position;
        statsViewController.teamName=self.teams.name;
    [self presentModalViewController:statsViewController animated:YES];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert!" message:@"No player in team" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)newGameAdded:(Game *)game{
    [self.games addObject:game];
    [self.tableView reloadData];
    self.test=@"reach";
}

@end
