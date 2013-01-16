//
//  OnlineSettingsViewController.m
//  Baskeepr
//
//  Created by andy on 13/1/15.
//
//

#import "OnlineSettingsViewController.h"

@interface OnlineSettingsViewController ()

@end

@implementation OnlineSettingsViewController
@synthesize gameTimeTextField = _gameTimeTextField;
@synthesize delegate = _delegate;

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
    UIDatePicker *datePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake( 0.0 , 0.0 , 0.0 , 0.0 )]; 
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    datePicker.minuteInterval = 5;
    
    _gameTimeTextField.inputView = datePicker;
    
    //Set default date value
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    if ([_gamePlaceTextField.text isEqualToString:@""])
    {
        _gameTimeTextField.text = strDate;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_gameTimeTextField.text forKey:@"onlineGameTime"];
    }
    
    // create a done view + done button, attach to it a doneClicked action, and place it in a toolbar as an accessory input view...
    // Prepare done button
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                    style:UIBarButtonItemStyleBordered target:self
                                                                   action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    
    // Plug the keyboardDoneButtonView into the text field...
    _gameTimeTextField.inputAccessoryView = keyboardDoneButtonView;
    
    // UISwipeLeftGestureRecognizer
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _gameTimeTextField.text = [defaults objectForKey:@"onlineGameTime"];
    _gamePlaceTextField.text = [defaults objectForKey:@"onlineGamePlace"];
}

- (void)dateChanged:(id)sender
{
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    _gameTimeTextField.text = strDate;
    
}

- (void)doneClicked:(id)sender {
    // Write out the date...
    [_gameTimeTextField resignFirstResponder];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_gameTimeTextField.text forKey:@"onlineGameTime"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didEditField:(id)sender
{
    [sender resignFirstResponder];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_gamePlaceTextField.text forKey:@"onlineGamePlace"];
}

- (void)swipeLeft:(UISwipeGestureRecognizer *)recognizer
{
    [_delegate dissmissSettingsView];
}
@end
