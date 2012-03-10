//
//  teamAddPlayerViewController.m
//  Baskeepr
//
//  Created by andy on 12/1/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "teamAddPlayerViewController.h"

@implementation teamAddPlayerViewController
@synthesize nameField;
@synthesize numberField;
@synthesize positionLabel;
@synthesize heightField;
@synthesize weightField;
@synthesize positionControl;
@synthesize delegate;
@synthesize scrollView;

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
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addButtonClicked:)];
    
            self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*1.4);
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

-(IBAction)changePostionClicked:(id)sender{
    int positionNumber=self.positionControl.value;

    switch (positionNumber) {
        case 1:
            self.positionLabel.text=@"PG";
            break;
        case 2:
            self.positionLabel.text=@"SG";
            break;
        case 3:
            self.positionLabel.text=@"SF";
            break;
        case 4:
            self.positionLabel.text=@"PF";
            break;
        case 5:
            self.positionLabel.text=@"C";
            break;
        default:
            break;
    }
}

-(void)cancelButtonClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)addButtonClicked:(id)sender{
    Player *player=[[Player alloc]init];
    player.name=self.nameField.text;
    player.number=self.numberField.text;
    player.position=self.positionLabel.text;
    player.height=self.heightField.text;
    player.weight=self.weightField.text;
    
    [delegate newPlayerAdded:player];

}

-(IBAction)doEditField:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)doHitBackground:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
    [self.heightField resignFirstResponder];
    [self.weightField resignFirstResponder];
}



@end
