//
//  teamMainPageViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "teamMainPageViewController.h"
#import "teamAddTeamViewController.h"


@implementation teamMainPageViewController
@synthesize dataSource;
@synthesize sectionTitleKey;
@synthesize teams;
@synthesize teamStats;
@synthesize gameAdded;
@synthesize test;




- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        sectionTitleKey=@"sectionTitleKey";
        self.title=@"Team";
        teamStats=[[scoreboardTeamStatsViewController alloc]init];
        teamStats.delegate=self;
        [self loadTeams];
        
        if(gameAdded){
            [self newGameAddedToTeam:gameAdded];
        }
       
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

      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backButtonClicked:)];      
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked:)];
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if(interfaceOrientation==UIInterfaceOrientationLandscapeLeft){
            return YES;
        }
//        else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
//            return YES;
//        }
        else{
            return NO;
        }
    } else {
        return NO;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.teams count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Team *team=[self.teams objectAtIndex:section];
    return team.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"Information";
            break;
        case 1:
            cell.textLabel.text=@"Players";
            break;
        case 2:
            cell.textLabel.text=@"Games";
            break;
        default:
            break;
    }

    
    
    
    return cell;
}

-(NSString*)teamFilePath{
    NSArray *dirs=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docPath=[dirs objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:@"team.archiveObject"];
}

-(void)loadTeams{
    NSArray *Teams=[NSKeyedUnarchiver unarchiveObjectWithFile:[self teamFilePath]];
    if(Teams){
        self.teams=[Teams mutableCopy];
    }
    else{
        self.teams=[NSMutableArray array];
    }
//    [self.teams removeAllObjects];
//    [self saveTeams];
}

-(void)saveTeams{
    [NSKeyedArchiver archiveRootObject:self.teams toFile:[self teamFilePath]];
}

-(void)newTeamAdded:(Team *)team{

    [self.teams addObject:team];
    [self saveTeams];
    [self.tableView reloadData];
    [self dismissModalViewControllerAnimated:YES];
}

-(void)newPlayerAddedToTeam{

    [self saveTeams];
    [self.tableView reloadData];
}

-(void)newGameAddedToTeam:(Game *)game{
    Team *team=[self.teams objectAtIndex:teamIndex];
    team.games=[[NSMutableArray alloc]init];
    self.test=@"IN";
    [team.games addObject:game];
    [self.tableView reloadData];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        teamIntroductionPageViewController *introductionPageViewController=[[teamIntroductionPageViewController alloc]initWithNibName:@"teamIntroductionPageViewController" bundle:nil];
        introductionPageViewController.teams=[self.teams objectAtIndex:indexPath.section];
        [self.navigationController pushViewController:introductionPageViewController animated:YES];
    }
    if (indexPath.row==1) {

        teamPlayerPageViewController *playerPageViewController=[[teamPlayerPageViewController alloc]initWithNibName:@"teamPlayerPageViewController" bundle:nil];
        playerPageViewController.delegate=self;
        Team *team=[self.teams objectAtIndex:indexPath.section];
        //如果team.players不存在，則創建一個
        if(!team.players){
        team.players=[[NSMutableArray alloc]init];
        }
        playerPageViewController.players=team.players;
        teamIndex=indexPath.section;
    
        [self.navigationController pushViewController:playerPageViewController animated:YES];
    }
    if(indexPath.row==2){
        teamGamePageVIewController *gamePageViewController=[[teamGamePageVIewController alloc]initWithNibName:@"teamGamePageVIewController" bundle:nil];
        Team *team=[self.teams objectAtIndex:indexPath.section];
        //如果team.games不存在，則創建一個
        if (!team.games) {
            team.games=[[NSMutableArray alloc]init];
        }
        if(!team.players){
            team.players=[[NSMutableArray alloc]init];
        }
        gamePageViewController.teams=[self.teams objectAtIndex:indexPath.section];
        gamePageViewController.players=team.players;
        gamePageViewController.games=team.games;
        
        teamIndex=indexPath.section;
        [self.navigationController pushViewController:gamePageViewController animated:YES]; 
    }
    

    
}

-(void)addButtonClicked:(id)sender{
    teamAddTeamViewController *addTeamViewController=[[teamAddTeamViewController alloc]initWithNibName:@"teamAddTeamViewController" bundle:nil];
    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:addTeamViewController];
    addTeamViewController.delegate=self;
    [self presentModalViewController:navController animated:YES];
}

-(void)backButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}
@end
