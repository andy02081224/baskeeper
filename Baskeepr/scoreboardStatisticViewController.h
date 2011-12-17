//
//  scoreboardStatisticViewController.h
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface scoreboardStatisticViewController : UIViewController{
    UIScrollView *scrollView;
}

@property(strong, nonatomic)IBOutlet UIScrollView *scrollView;

-(IBAction)optionClicked:(id)sender;
@end
