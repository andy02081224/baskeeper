//
//  scoreboardOptionCustomViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardOptionCustomViewController.h"

@implementation scoreboardOptionCustomViewController
@synthesize labelHomeName;
@synthesize homeName;
@synthesize labelHomeScore;
@synthesize homeScoreControl;
@synthesize labelHomeFoul;
@synthesize homeFoulControl;
@synthesize labelHomeTOL;
@synthesize homeTOLControl;

@synthesize labelGuestName;
@synthesize guestName;
@synthesize labelGuestScore;
@synthesize guestScoreControl;
@synthesize labelGuestFoul;
@synthesize guestFoulControl;
@synthesize labelGuestTOL;
@synthesize guestTOLControl;

@synthesize labelName;
@synthesize labelScore;
@synthesize labelFoul;
@synthesize labelTOL;

@synthesize labelMin;
@synthesize labelSec;
@synthesize labelPeriod;

@synthesize timePicker;
@synthesize customItem;

@synthesize minutes;
@synthesize seconds;
@synthesize period;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        minutes=[[NSMutableArray alloc]init];
        seconds=[[NSMutableArray alloc]init];
        period=[[NSMutableArray alloc]init];
        
        homeScoreControl=[[UIStepper alloc]init];
        homeFoulControl=[[UIStepper alloc]init];
        homeTOLControl=[[UIStepper alloc]init];
        guestScoreControl=[[UIStepper alloc]init];
        guestFoulControl=[[UIStepper alloc]init];
        guestTOLControl=[[UIStepper alloc]init];
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
                
    //將值加入NSMutableArray
    for(int i=0;i<100;i++){
        NSString *min;
        min=[NSString stringWithFormat:@"%d",i];
        [minutes addObject:min];
    }
    
    for(int i=0;i<60;i++){
        NSString *sec;
        sec=[NSString stringWithFormat:@"%d",i];
        [seconds addObject:sec];
    }
    
    for(int i=0;i<11;i++){
        NSString *prd;
        prd=[NSString stringWithFormat:@"%d",i];
        [period addObject:prd];
        

    }
    
    //設定stepper範圍與起始值
//    [homeScoreControl setMaximumValue:999.0];
//    [homeScoreControl setMinimumValue:0.0];
//    [homeScoreControl setValue:0.0];
//    [homeScoreControl setStepValue:1.0];//設定每次增減的值
//    [homeScoreControl setContinuous:YES];//持續按壓可以連續增加值
//    [homeScoreControl setWraps:YES];//到最大值時會再次循環到最小值
//    [homeScoreControl addTarget:self action:@selector(homeScoreChanged) forControlEvents:UIControlEventValueChanged];

    
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

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0){
        return [minutes count];
    }
    else if(component==1){
        return [seconds count];
    }
    else{
        return [period count];
    }
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
        
        if(component==0){
            return [minutes objectAtIndex:row];
        }
        else if(component==1){
            return [seconds objectAtIndex:row];
        }
        else{
            return [period objectAtIndex:row];
        }
}

-(IBAction)customItemClicked:(id)sender{
    switch (customItem.selectedSegmentIndex) {
        case 0:
            timePicker.hidden=YES;
            labelHomeName.hidden=NO;
            homeName.hidden=NO;
            labelHomeScore.hidden=NO;
            homeScoreControl.hidden=NO;
            labelHomeFoul.hidden=NO;
            homeFoulControl.hidden=NO;
            labelHomeTOL.hidden=NO;
            homeTOLControl.hidden=NO;
            
            labelGuestName.hidden=NO;
            guestName.hidden=NO;
            labelGuestScore.hidden=NO;
            guestScoreControl.hidden=NO;
            labelGuestFoul.hidden=NO;
            guestFoulControl.hidden=NO;
            labelGuestTOL.hidden=NO;
            guestTOLControl.hidden=NO;
            
            labelName.hidden=NO;
            labelScore.hidden=NO;
            labelFoul.hidden=NO;
            labelTOL.hidden=NO;
            
            labelMin.hidden=YES;
            labelSec.hidden=YES;
            labelPeriod.hidden=YES;
            break;
        case 1:
            timePicker.hidden=NO;
            labelHomeName.hidden=YES;
            homeName.hidden=YES;
            labelHomeScore.hidden=YES;
            homeScoreControl.hidden=YES;
            labelHomeFoul.hidden=YES;
            homeFoulControl.hidden=YES;
            labelHomeTOL.hidden=YES;
            homeTOLControl.hidden=YES;
            
            labelGuestName.hidden=YES;
            guestName.hidden=YES;
            labelGuestScore.hidden=YES;
            guestScoreControl.hidden=YES;
            labelGuestFoul.hidden=YES;
            guestFoulControl.hidden=YES;
            labelGuestTOL.hidden=YES;
            guestTOLControl.hidden=YES;
            
            labelName.hidden=YES;
            labelScore.hidden=YES;
            labelFoul.hidden=YES;
            labelTOL.hidden=YES;
            
            labelMin.hidden=NO;
            labelSec.hidden=NO;
            labelPeriod.hidden=NO;
            
        default:
            break;
    }
}

-(IBAction)backButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)doEditField:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)hitBackground:(id)sender{
    [homeName resignFirstResponder];
    [guestName resignFirstResponder];
}


-(IBAction)changeHomeScore:(id)sender{
    labelHomeScore.text=[NSString stringWithFormat:@"%.0f",homeScoreControl.value];
}

-(IBAction)changeHomeFoul:(id)sender{
    labelHomeFoul.text=[NSString stringWithFormat:@"%.0f",homeFoulControl.value];
}

-(IBAction)changeHomeTOL:(id)sender{
    labelHomeTOL.text=[NSString stringWithFormat:@"%.0f",homeTOLControl.value];
}

-(IBAction)changeGuestScore:(id)sender{
    labelGuestScore.text=[NSString stringWithFormat:@"%.0f",guestScoreControl.value];
}

-(IBAction)changeGuestFoul:(id)sender{
    labelGuestFoul.text=[NSString stringWithFormat:@"%.0f",guestFoulControl.value];
}

-(IBAction)changeGuestTOL:(id)sender{
    labelGuestTOL.text=[NSString stringWithFormat:@"%.0f",guestTOLControl.value];
}


@end
