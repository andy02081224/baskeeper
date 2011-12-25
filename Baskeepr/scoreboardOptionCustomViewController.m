//
//  scoreboardOptionCustomViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardOptionCustomViewController.h"
#import "GameMode.h"

@implementation scoreboardOptionCustomViewController
@synthesize delegate;

@synthesize labelHomeName;
@synthesize homeName;

@synthesize labelGuestName;
@synthesize guestName;
@synthesize foulControl;
@synthesize tolControl;
@synthesize foulLimit;
@synthesize timeOutLeft;

@synthesize labelName;
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

@synthesize test;

//@synthesize custom;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        minutes=[[NSMutableArray alloc]init];
        seconds=[[NSMutableArray alloc]init];
        period=[[NSMutableArray alloc]init];
        
        foulControl=[[UIStepper alloc]init];
        tolControl=[[UIStepper alloc]init];
        
        
        
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
        
        for(int i=1;i<11;i++){
            NSString *prd;
            prd=[NSString stringWithFormat:@"%d",i];
            [period addObject:prd];
            
            
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
    // Do any additional setup after loading the view from its nib.
    //[self loadSettings];
    //將值加入NSMutableArray

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    homeName.text=[defaults objectForKey:@"homeName"];
    guestName.text=[defaults objectForKey:@"guestName"];
    foulLimit.text=[defaults objectForKey:@"foul"];
    timeOutLeft.text=[defaults objectForKey:@"tol"];
    int previousMinute=[[defaults objectForKey:@"minutes"]intValue];
    [timePicker selectRow:previousMinute inComponent:0 animated:YES];
    [self pickerView:timePicker didSelectRow:previousMinute inComponent:0];
    int previousSecond=[[defaults objectForKey:@"seconds"]intValue];
    [timePicker selectRow:previousSecond inComponent:1 animated:YES];
    [self pickerView:timePicker didSelectRow:previousSecond inComponent:1];
    int previousPeriod=[[defaults objectForKey:@"period"]intValue];
    [timePicker selectRow:previousPeriod inComponent:2 animated:YES];
    [self pickerView:timePicker didSelectRow:previousPeriod inComponent:2];
    
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

-(void)loadSettings{
    
    


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

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if(component==0){
        minSelected=[[minutes objectAtIndex:row]intValue]*60;
        test.text=[NSString stringWithFormat:@"%d",minSelected];
        NSString *Row=[NSString stringWithFormat:@"%d",row];
        [defaults setObject:Row forKey:@"minutes"];
    }
    if(component==1){
        secSelected=[[seconds objectAtIndex:row]intValue];
        NSString *Row=[NSString stringWithFormat:@"%d",row];
        test.text=[NSString stringWithFormat:@"%d",secSelected];
        [defaults setObject:Row forKey:@"seconds"];
    }
    if(component==2){
        periodSelected=[[period objectAtIndex:row]intValue];
        NSString *Row=[NSString stringWithFormat:@"%d",row];
        [defaults setObject:Row forKey:@"period"];
    }
}

-(IBAction)customItemClicked:(id)sender{
    switch (customItem.selectedSegmentIndex) {
        case 0:
            timePicker.hidden=YES;
            labelHomeName.hidden=NO;
            homeName.hidden=NO;
            labelGuestName.hidden=NO;
            guestName.hidden=NO;
            
            labelName.hidden=NO;
            labelFoul.hidden=NO;
            labelTOL.hidden=NO;
            
            foulControl.hidden=NO;
            tolControl.hidden=NO;
            foulLimit.hidden=NO;
            timeOutLeft.hidden=NO;
            
            labelMin.hidden=YES;
            labelSec.hidden=YES;
            labelPeriod.hidden=YES;
            break;
        case 1:
            timePicker.hidden=NO;
            labelHomeName.hidden=YES;
            homeName.hidden=YES;
            labelGuestName.hidden=YES;
            guestName.hidden=YES;
            
            foulControl.hidden=YES;
            tolControl.hidden=YES;
            foulLimit.hidden=YES;
            timeOutLeft.hidden=YES;
            
            labelName.hidden=YES;
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

    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:homeName.text forKey:@"homeName"];
    [defaults setObject:guestName.text forKey:@"guestName"];
    [defaults setObject:foulLimit.text forKey:@"foul"];
    [defaults setObject:timeOutLeft.text forKey:@"tol"];
    NSString *Time=[NSString stringWithFormat:@"%d",minSelected+secSelected];
    NSString *Period=[NSString stringWithFormat:@"%d",periodSelected];
    NSMutableDictionary *custom=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"custom",@"modeName",homeName.text,@"homeName",guestName.text,@"guestName",Time,@"time",Period,@"period",foulLimit.text,@"foul",timeOutLeft.text,@"tol", nil];

    [delegate setCustomMode:custom];
    [self dismissModalViewControllerAnimated:YES];
    

}

-(IBAction)doEditField:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)hitBackground:(id)sender{
    [homeName resignFirstResponder];
    [guestName resignFirstResponder];
}

-(IBAction)changeFoul:(id)sender{
    self.foulLimit.text=[NSString stringWithFormat:@"%.0f",foulControl.value]; 
}

-(IBAction)changeTOL:(id)sender{
    self.timeOutLeft.text=[NSString stringWithFormat:@"%.0f",tolControl.value];
}




@end
