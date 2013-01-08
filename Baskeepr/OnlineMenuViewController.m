//
//  OnlineMenuViewController.m
//  Baskeepr
//
//  Created by andy on 13/1/5.
//
//

#import "OnlineMenuViewController.h"
#import "CreateGameViewController.h"
#import "JoinGameViewController.h"
#import "OnlineScoreboardViewController.h"

@interface OnlineMenuViewController ()

@property (strong, nonatomic)UITextField *gameNameTextField;
@property (strong, nonatomic)UITextField *gamePasswordTextField;

@end

@implementation OnlineMenuViewController
@synthesize gameNameTextField = _gameNameTextField;
@synthesize gamePasswordTextField  = _gamePasswordTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createButtonClicked:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Create New Game" message:@"Enter the name and password to create a new game" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    self.gameNameTextField = [alertView textFieldAtIndex:0];
    self.gamePasswordTextField = [alertView textFieldAtIndex:1];
    
    self.gameNameTextField.placeholder = @"Game Name";
    self.gamePasswordTextField.placeholder = @"Password";
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        // Send gameNameTextField.text & gamePasswordTextField.text to server
        
        OnlineScoreboardViewController *onlineScoreboardViewController = [[OnlineScoreboardViewController alloc]initWithNibName:@"OnlineScoreboardViewController" bundle:nil];
        [self presentViewController:onlineScoreboardViewController animated:YES completion:nil];
    }
}

- (IBAction)joinButtonClicked:(id)sender
{
    JoinGameViewController *joinGameViewController = [[JoinGameViewController alloc]initWithNibName:@"JoinGameViewController" bundle:nil];
    [self presentViewController:joinGameViewController animated:YES completion:nil];
}
@end
