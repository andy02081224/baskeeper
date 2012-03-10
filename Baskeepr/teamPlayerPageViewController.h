//
//  teamPlayerPageViewController.h
//  Baskeepr
//
//  Created by andy on 12/1/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "teamAddPlayerViewController.h"
#import "Team.h"

@protocol playerPageDelegate <NSObject>

-(void)newPlayerAddedToTeam;

@end

@interface teamPlayerPageViewController : UITableViewController<addPlayerDelegate>

@property(strong, nonatomic)id<playerPageDelegate>delegate;
@property(strong, nonatomic)NSMutableArray *players;

@property(strong, nonatomic)Team *teams;
-(void)newPlayerAdded:(Player *)player;
@end
