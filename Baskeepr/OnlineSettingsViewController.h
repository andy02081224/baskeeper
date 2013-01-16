//
//  OnlineSettingsViewController.h
//  Baskeepr
//
//  Created by andy on 13/1/15.
//
//

#import <UIKit/UIKit.h>

@protocol OnlineSettingsDelegate <NSObject>

- (void)dissmissSettingsView;

@end

@interface OnlineSettingsViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *gameTimeTextField;
@property (strong, nonatomic) IBOutlet UITextField *gamePlaceTextField;
- (IBAction)didEditField:(id)sender;
@property (unsafe_unretained) id<OnlineSettingsDelegate>delegate;

@end
