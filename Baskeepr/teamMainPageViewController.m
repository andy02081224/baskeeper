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



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        sectionTitleKey=@"sectionTitleKey";
        self.title=@"Team";
        [self loadTeams];
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
self.title=@"Team";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //self.dataSource=[[NSMutableArray alloc]initWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"Baskeeper", sectionTitleKey,nil],nil];
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
        else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
            return YES;
        }
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
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.teams count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Team *team=[self.teams objectAtIndex:section];
    return team.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
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
    //Team *team = [self.teams objectAtIndex:indexPath.section];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"Introduction";
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
//Delete File
    //    NSFileManager *manager=[NSFileManager defaultManager];
//    [manager removeItemAtPath:[self teamFilePath] error:NULL];
    
    
    NSArray *Teams=[NSKeyedUnarchiver unarchiveObjectWithFile:[self teamFilePath]];
    if(Teams){
        self.teams=[Teams mutableCopy]; 
    }
    else{
        self.teams=[NSMutableArray array];
    }
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
        [self.navigationController pushViewController:playerPageViewController animated:YES];
    }
    if(indexPath.row==2){
        teamGamePageVIewController *gamePageViewController=[[teamGamePageVIewController alloc]initWithNibName:@"teamGamePageVIewController" bundle:nil];
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
