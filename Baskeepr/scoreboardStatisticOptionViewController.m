//
//  scoreboardStatisticOptionViewController.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "scoreboardStatisticOptionViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation scoreboardStatisticOptionViewController
@synthesize delegate;
@synthesize  position;
@synthesize positionControll;
@synthesize numberPicker;
@synthesize numbers;

@synthesize numberChosen;
@synthesize labelPGChosen;
@synthesize labelSGChosen;
@synthesize labelSFChosen;
@synthesize labelPFChosen;
@synthesize labelCenterChosen;


@synthesize test;

@synthesize pointGuard;
@synthesize shootingGuard;
@synthesize smallFoward;
@synthesize powerFoward;
@synthesize center;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        numbers=[[NSMutableArray alloc]init];
        
        pointGuard=[[NSMutableArray alloc]init];
        shootingGuard=[[NSMutableArray alloc]init];
        smallFoward=[[NSMutableArray alloc]init];
        powerFoward=[[NSMutableArray alloc]init];
        center=[[NSMutableArray alloc]init];


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
    for (int i=0; i<100; i++) {
        NSString *n;
        n=[NSString stringWithFormat:@"%d",i];
        [numbers addObject:n];
        self.numberChosen=@"0";
    }
    

    
    
//    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    myButton.frame = CGRectMake(20, 20, 200, 44); // position in the parent view and set the size of the button(x,y,width.height)
//    
//    [myButton setTitle:@"Click Me!" forState:UIControlStateNormal];
//    [self.view addSubview:myButton];
 

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
        self.position.text=@"PG";
        self.labelPGChosen.hidden=NO;
        self.labelSGChosen.hidden=YES;
        self.labelSFChosen.hidden=YES;
        self.labelPFChosen.hidden=YES;
        self.labelCenterChosen.hidden=YES;
    }
    if (positionControll.selectedSegmentIndex==1) {
        self.position.text=@"SG";
        self.labelPGChosen.hidden=YES;
        self.labelSGChosen.hidden=NO;
        self.labelSFChosen.hidden=YES;
        self.labelPFChosen.hidden=YES;
        self.labelCenterChosen.hidden=YES;
    }
    if (positionControll.selectedSegmentIndex==2) {
        self.position.text=@"SF";
        self.labelPGChosen.hidden=YES;
        self.labelSGChosen.hidden=YES;
        self.labelSFChosen.hidden=NO;
        self.labelPFChosen.hidden=YES;
        self.labelCenterChosen.hidden=YES;
    }
    if (positionControll.selectedSegmentIndex==3) {
        self.position.text=@"PF";
        self.labelPGChosen.hidden=YES;
        self.labelSGChosen.hidden=YES;
        self.labelSFChosen.hidden=YES;
        self.labelPFChosen.hidden=NO;
        self.labelCenterChosen.hidden=YES;
    }
    if (positionControll.selectedSegmentIndex==4) {
        self.position.text=@"C";
        self.labelPGChosen.hidden=YES;
        self.labelSGChosen.hidden=YES;
        self.labelSFChosen.hidden=YES;
        self.labelPFChosen.hidden=YES;
        self.labelCenterChosen.hidden=NO;
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [numbers count];
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.numbers objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if([self.position.text isEqualToString:@"PG"]){
        self.numberChosen=[NSString stringWithFormat:@"%d",row];

        
    }
    if([self.position.text isEqualToString:@"SG"]){
              self.numberChosen=[NSString stringWithFormat:@"%d",row];
    }
    if([self.position.text isEqualToString:@"SF"]){
             self.numberChosen=[NSString stringWithFormat:@"%d",row]; 
    }
    if([self.position.text isEqualToString:@"PF"]){
              self.numberChosen=[NSString stringWithFormat:@"%d",row];
    }
    if([self.position.text isEqualToString:@"C"]){
              self.numberChosen=[NSString stringWithFormat:@"%d",row]; 
    }
}

-(IBAction)dismissButtonClicked:(id)sender{
    NSArray *numberForEachPosition=[NSArray arrayWithObjects:self.pointGuard,self.shootingGuard,self.smallFoward,self.powerFoward,self.center, nil];
    [delegate setPositionNumbers:numberForEachPosition];
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)addButtonClicked:(id)sender{

    
    
    
    if([self.position.text isEqualToString:@"PG"]){
        if([pointGuard count]<5){
        [pointGuard addObject:numberChosen];
            [self addPlayerChosen];
        }
        
    }
    if([self.position.text isEqualToString:@"SG"]){
        if([shootingGuard count]<5){
        [shootingGuard addObject:numberChosen];
                [self addPlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"SF"]){
        if([smallFoward count]<5){
        [smallFoward addObject:numberChosen];
                [self addPlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"PF"]){
        if([powerFoward count]<5){
        [powerFoward addObject:numberChosen];
                [self addPlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"C"]){
        if([center count]<5){
        [center addObject:numberChosen];
                [self addPlayerChosen];
        }
    } 
}

-(IBAction)deleteButtonClicked:(id)sender{
    UIButton *button=(UIButton*)sender;
    int index=button.tag;
    self.test.text=[NSString stringWithFormat:@"%d",index];
    
    if([self.position.text isEqualToString:@"PG"]){
        if([pointGuard count]>index){
        [pointGuard removeObjectAtIndex:index];
        self.labelPGChosen.text=@"";
            [self deletePlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"SG"]){
        if([shootingGuard count]>index){
        [shootingGuard removeObjectAtIndex:index];
        self.labelSGChosen.text=@"";
        [self deletePlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"SF"]){
        if([smallFoward count]>index){
        [smallFoward removeObjectAtIndex:index];
        self.labelSFChosen.text=@"";
            [self deletePlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"PF"]){
        if([powerFoward count]>index){
        [powerFoward removeObjectAtIndex:index];
        self.labelPFChosen.text=@"";
            [self deletePlayerChosen];
        }
    }
    if([self.position.text isEqualToString:@"C"]){
        if([center count]>index){
        [center removeObjectAtIndex:index];
        self.labelCenterChosen.text=@"";
            [self deletePlayerChosen];
        }
    }
}

-(void)addPlayerChosen{
    if([position.text isEqualToString:@"PG"]){
        

        if([pointGuard count]>0){
    int i=[pointGuard count]-1;
    self.labelPGChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelPGChosen.text,[pointGuard objectAtIndex:i]];
             //self.labelPGChosen.font=[UIFont fontWithName:@"System" size:60.0];
    self.labelPGChosen.frame = CGRectMake(100,0,200,800);//Set the frame of the label to the maximum size
        [self.labelPGChosen sizeToFit];//Call sizeToFit to reduce the frame size so the contents just fit
        
        }
    
    }
    
    if([position.text isEqualToString:@"SG"]){
        
        if([shootingGuard count]>0){
            int i=[shootingGuard count]-1;
            self.labelSGChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelSGChosen.text,[shootingGuard objectAtIndex:i]];
            self.labelSGChosen.frame = CGRectMake(100,0,200,800);
            [self.labelSGChosen sizeToFit]; 
            
        }
        
    }
    
    if([position.text isEqualToString:@"SF"]){

        if([smallFoward count]>0){
            int i=[smallFoward count]-1;
            self.labelSFChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelSFChosen.text,[smallFoward objectAtIndex:i]];
            self.labelSFChosen.frame = CGRectMake(100,0,200,800);
            [self.labelSFChosen sizeToFit];
        }
    }
    
    if([position.text isEqualToString:@"PF"]){

        if([powerFoward count]>0){
            int i=[powerFoward count]-1;
            self.labelPFChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelPFChosen.text,[powerFoward objectAtIndex:i]];
            self.labelPFChosen.frame = CGRectMake(100,0,200,800);
            [self.labelPFChosen sizeToFit];
        }
        
    }
    
    if([position.text isEqualToString:@"C"]){

        if([center count]>0){
            int i=[center count]-1;
            self.labelCenterChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelCenterChosen.text,[center objectAtIndex:i]];
            self.labelCenterChosen.frame = CGRectMake(100,0,200,800);
            [self.labelCenterChosen sizeToFit];
        }
        
    }

}

-(void)deletePlayerChosen{
    
    if([position.text isEqualToString:@"PG"]){
        
        
        if([pointGuard count]>0){
            for(int i=0;i<[pointGuard count];i++){
                self.labelPGChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelPGChosen.text,[pointGuard objectAtIndex:i]];
                self.labelPGChosen.frame = CGRectMake(100,0,200,800);
                [self.labelPGChosen sizeToFit];
            }           
            
        }
        
    }
    
    if([position.text isEqualToString:@"SG"]){
        
        if([shootingGuard count]>0){
            for(int i=0;i<[shootingGuard count];i++){
                self.labelSGChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelSGChosen.text,[shootingGuard objectAtIndex:i]];
                self.labelSGChosen.frame = CGRectMake(100,0,200,800);
                [self.labelSGChosen sizeToFit];
            }
            
        }
        
    }
    
    if([position.text isEqualToString:@"SF"]){
        
        if([smallFoward count]>0){
            for(int i=0;i<[smallFoward count];i++){
                self.labelSFChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelSFChosen.text,[smallFoward objectAtIndex:i]];
                self.labelSFChosen.frame = CGRectMake(100,0,200,800);
                [self.labelSFChosen sizeToFit];
            }
        }
    }
    
    if([position.text isEqualToString:@"PF"]){
        
        if([powerFoward count]>0){
            for(int i=0;i<[powerFoward count];i++){
                self.labelPFChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelPFChosen.text,[powerFoward objectAtIndex:i]];
                self.labelPFChosen.frame = CGRectMake(100,0,200,800);
                [self.labelPFChosen sizeToFit];
            }
        }
        
    }
    
    if([position.text isEqualToString:@"C"]){
        
        if([center count]>0){
            for(int i=0;i<[center count];i++){
                self.labelCenterChosen.text=[NSString stringWithFormat:@"%@\n#%@",self.labelCenterChosen.text,[center objectAtIndex:i]];
                self.labelCenterChosen.frame = CGRectMake(100,0,200,800);
                [self.labelCenterChosen sizeToFit];
            }
        }
        
    }
}





@end
