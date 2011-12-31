//
//  scoreboardPlayerStatsViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardPlayerStatsViewController.h"
#import "statsTableViewCell.h"

@implementation scoreboardPlayerStatsViewController
@synthesize statsModeControl;
@synthesize statsTable;


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
    self.statsTable.separatorColor=[UIColor whiteColor];//分隔線顏色
    
    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 17;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    statsTableViewCell *cell = (statsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[statsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.lineColor = [UIColor whiteColor];
    }
	
	// Since we are drawing the lines ourself, we need to know which cell is the top cell in the table so that
	// we can draw the line on the top
	if (indexPath.row == 0)
		cell.topCell = YES;
	else
		cell.topCell = NO;
	
	// Configure the cell.
    
    if(indexPath.row==0){
	cell.cell1.text = @"NO.";
	cell.cell2.text = @"FGM-A";
	cell.cell3.text = @"3PM-A";
    cell.cell4.text=@"FTM-A";
    cell.cell5.text=@"O/D\nREB";
    cell.cell6.text = @"AST";
    cell.cell7.text = @"PF";
    cell.cell8.text = @"ST";
    cell.cell9.text=@"TO";
    cell.cell10.text=@"BS";
    cell.cell11.text=@"PT";
    }
    else{
        cell.cell1.text = @"88";
        cell.cell2.text = @"23";
        cell.cell3.text = @"11/21";
    }
	
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

}


-(IBAction)changeStatsMode:(id)sender{
    if(statsModeControl.selectedSegmentIndex==1){
        scoreboardTeamStatsViewController *modalViewController=[[scoreboardTeamStatsViewController alloc]initWithNibName:@"scoreboardTeamStatsViewController" bundle:nil];
        [self presentModalViewController:modalViewController animated:NO];
    }
}

-(void)drawRect:(CGRect)rect{
    
}

@end
