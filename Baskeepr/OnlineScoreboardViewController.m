//
//  OnlineScoreboardViewController.m
//  Baskeepr
//
//  Created by andy on 13/1/5.
//
//

#import "OnlineScoreboardViewController.h"
#import "MPFlipTransition.h"
#import "MPFlipEnumerations.h"

@interface OnlineScoreboardViewController ()

@property (strong, nonatomic)scoreboardStatisticViewController *boxView;

@end

@implementation OnlineScoreboardViewController
@synthesize boxView = _boxView;

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
    // Set right swipe gesture recognizer
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightRecognizer];
    // Set left swipe gesture recognizer
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    
    self.boxView = [[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
}

- (void)swipeRight:(UISwipeGestureRecognizer *)recognizer
{
    OnlineSettingsViewController *settingsView = [[OnlineSettingsViewController alloc]initWithNibName:@"OnlineSettingsViewController" bundle:nil];
    settingsView.delegate = self;
    [self presentViewController:settingsView flipStyle:MPFlipStyleDirectionBackward completion:nil];
}

- (void)swipeLeft:(UISwipeGestureRecognizer *)recognizer
{
//    scoreboardStatisticViewController *boxView = [[scoreboardStatisticViewController alloc]initWithNibName:@"scoreboardStatisticViewController" bundle:nil];
    _boxView.delegate = self;
    [self presentViewController:_boxView flipStyle:MPFlipStyleDefault completion:nil];
}

- (void)updateScore:(NSString *)score
{
    self.scoreLabel.text = score;
}

- (void)updatePeriod:(NSString *)period
{
    self.periodLabel.text = period;
}

- (void)dismissBoxView
{
    [self dismissViewControllerWithFlipStyle:MPFlipStyleDirectionBackward completion:nil];
}

- (void)dissmissSettingsView
{
    [self dismissViewControllerWithFlipStyle:MPFlipStyleDefault completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addFoulButtonClicked:(id)sender {
}

- (IBAction)minusFoulButtonClicked:(id)sender {
}

- (IBAction)MinusTOLButtonClicked:(id)sender {
}
@end
