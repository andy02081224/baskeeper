//
//  scoreboardStatisticOptionViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardStatisticOptionViewController.h"

@implementation scoreboardStatisticOptionViewController
@synthesize  position;
@synthesize positionControll;
@synthesize numberPicker;
@synthesize numbers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        numbers=[[NSMutableArray alloc]init];

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
    //numbers=[NSMutableArray arrayWithObjects:@"0",@"1", nil];
    for (int i=0; i<=100; i++) {
        NSString *n;
        n=[NSString stringWithFormat:@"%d",i];
        [numbers addObject:n];
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

-(IBAction)positionChosen:(id)sender{
    if (positionControll.selectedSegmentIndex==0) {
        position.text=@"PG";
    }
    if (positionControll.selectedSegmentIndex==1) {
        position.text=@"SG";
    }
    if (positionControll.selectedSegmentIndex==2) {
        position.text=@"SF";
    }
    if (positionControll.selectedSegmentIndex==3) {
        position.text=@"PF";
    }
    if (positionControll.selectedSegmentIndex==4) {
        position.text=@"C";
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return MAX_ROLL;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.numbers objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row{
    
}

-(IBAction)dismissButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}


@end
