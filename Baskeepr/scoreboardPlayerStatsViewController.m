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
@synthesize PGStats;
@synthesize SGStats;
@synthesize SFStats;
@synthesize PFStats;
@synthesize CenterStats;
@synthesize test;

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
    //return 17;
    return [PGStats count]+[SGStats count]+1;
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
//        playerStats *stats=[self.PGStats objectAtIndex:indexPath.row-1];
//        cell.cell1.text = stats.statsNumber;
//        cell.cell2.text = [NSString stringWithFormat:@"%@/%@",stats.statsFGM,stats.statsFGA];
//        cell.cell3.text = [NSString stringWithFormat:@"%@/%@",stats.stats3PM,stats.stats3PA];
//        cell.cell4.text = [NSString stringWithFormat:@"%@/%@",stats.statsFTM,stats.statsFTA];
//        cell.cell5.text = [NSString stringWithFormat:@"%@/%@",stats.statsOffReb,stats.statsOffReb];
//        cell.cell6.text=stats.statsAST;
//        cell.cell7.text=stats.statsPF;
//        cell.cell8.text=stats.statsST;
//        cell.cell9.text=stats.statsTO;
//        cell.cell10.text=stats.statsBS;
        
        
        while (YES) {
            
        /*point為指標，因為是以5的餘數來派斷依序顯示，
            所以當該位置沒有要顯示的時候需加一來正常運作
         round是循環，五個位置為一個循環
         */
        int i=(point+indexPath.row-1)%5;
        if(i==0){
            if(round<[self.PGStats count]){
                playerStats *pgStats=[self.PGStats objectAtIndex:round];
                cell.cell1.text=pgStats.statsNumber;
                cell.cell2.text = [NSString stringWithFormat:@"%@/%@",pgStats.statsFGM,pgStats.statsFGA];
                cell.cell3.text = [NSString stringWithFormat:@"%@/%@",pgStats.stats3PM,pgStats.stats3PA];
                cell.cell4.text = [NSString stringWithFormat:@"%@/%@",pgStats.statsFTM,pgStats.statsFTA];
                cell.cell5.text = [NSString stringWithFormat:@"%@/%@",pgStats.statsOffReb,pgStats.statsOffReb];
                cell.cell6.text=pgStats.statsAST;
                cell.cell7.text=pgStats.statsPF;
                cell.cell8.text=pgStats.statsST;
                cell.cell9.text=pgStats.statsTO;
                cell.cell10.text=pgStats.statsBS;
                
                break;
            }
            else{
                point++;
                i++;
            }
        }
        if (i==1){
            if(round<[self.SGStats count]){
                playerStats *sgStats=[self.SGStats objectAtIndex:round];
                cell.cell1.text=sgStats.statsNumber;
                cell.cell2.text = [NSString stringWithFormat:@"%@/%@",sgStats.statsFGM,sgStats.statsFGA];
                cell.cell3.text = [NSString stringWithFormat:@"%@/%@",sgStats.stats3PM,sgStats.stats3PA];
                cell.cell4.text = [NSString stringWithFormat:@"%@/%@",sgStats.statsFTM,sgStats.statsFTA];
                cell.cell5.text = [NSString stringWithFormat:@"%@/%@",sgStats.statsOffReb,sgStats.statsOffReb];
                cell.cell6.text=sgStats.statsAST;
                cell.cell7.text=sgStats.statsPF;
                cell.cell8.text=sgStats.statsST;
                cell.cell9.text=sgStats.statsTO;
                cell.cell10.text=sgStats.statsBS;
                break;
            }
            else{
                point++;
                i++;
            }
        }
        if(i==2){
            if(round<[self.SFStats count]){
                playerStats *sfStats=[self.SFStats objectAtIndex:round];
                cell.cell1.text=sfStats.statsNumber;
                cell.cell2.text = [NSString stringWithFormat:@"%@/%@",sfStats.statsFGM,sfStats.statsFGA];
                cell.cell3.text = [NSString stringWithFormat:@"%@/%@",sfStats.stats3PM,sfStats.stats3PA];
                cell.cell4.text = [NSString stringWithFormat:@"%@/%@",sfStats.statsFTM,sfStats.statsFTA];
                cell.cell5.text = [NSString stringWithFormat:@"%@/%@",sfStats.statsOffReb,sfStats.statsOffReb];
                cell.cell6.text=sfStats.statsAST;
                cell.cell7.text=sfStats.statsPF;
                cell.cell8.text=sfStats.statsST;
                cell.cell9.text=sfStats.statsTO;
                cell.cell10.text=sfStats.statsBS;
                break;
            }
            else{
                point++;
                i++;
            }
        }
        if(i==3){
            if(round<[self.PFStats count]){
                playerStats *pfStats=[self.PFStats objectAtIndex:round];
                cell.cell1.text=pfStats.statsNumber;
                cell.cell2.text = [NSString stringWithFormat:@"%@/%@",pfStats.statsFGM,pfStats.statsFGA];
                cell.cell3.text = [NSString stringWithFormat:@"%@/%@",pfStats.stats3PM,pfStats.stats3PA];
                cell.cell4.text = [NSString stringWithFormat:@"%@/%@",pfStats.statsFTM,pfStats.statsFTA];
                cell.cell5.text = [NSString stringWithFormat:@"%@/%@",pfStats.statsOffReb,pfStats.statsOffReb];
                cell.cell6.text=pfStats.statsAST;
                cell.cell7.text=pfStats.statsPF;
                cell.cell8.text=pfStats.statsST;
                cell.cell9.text=pfStats.statsTO;
                cell.cell10.text=pfStats.statsBS;
                break;
            }
            else{
                point++;
                i++;
            }
        }
        if(i==4){
            if(round<[self.CenterStats count]){
                playerStats *centerStats=[self.CenterStats objectAtIndex:round];
                cell.cell1.text=centerStats.statsNumber;
                cell.cell2.text = [NSString stringWithFormat:@"%@/%@",centerStats.statsFGM,centerStats.statsFGA];
                cell.cell3.text = [NSString stringWithFormat:@"%@/%@",centerStats.stats3PM,centerStats.stats3PA];
                cell.cell4.text = [NSString stringWithFormat:@"%@/%@",centerStats.statsFTM,centerStats.statsFTA];
                cell.cell5.text = [NSString stringWithFormat:@"%@/%@",centerStats.statsOffReb,centerStats.statsOffReb];
                cell.cell6.text=centerStats.statsAST;
                cell.cell7.text=centerStats.statsPF;
                cell.cell8.text=centerStats.statsST;
                cell.cell9.text=centerStats.statsTO;
                cell.cell10.text=centerStats.statsBS;
                break;
            }
            else{
                point++;
                i++;
            }
            round++;
        }
        
        
    }

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

-(IBAction)backButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
    //int i=[self.PGStats count];
    //self.test.text=[NSString stringWithFormat:@"%d",i];
    
}

-(void)setPlayerStats:(playerStats*)playerStats{
    
}

@end
