//
//  Room.h
//  BaskeeperOnline
//
//  Created by MrEJ on 13/1/16.
//
//

#import <Foundation/Foundation.h>

@interface Room : NSObject
@property (retain,nonatomic) NSString *r_id;
@property (retain,nonatomic) NSString *r_name;
@property (retain,nonatomic) NSString *r_password;
@property (retain,nonatomic) NSString *r_home_token;
@property (retain,nonatomic) NSString *r_away_token;


@end
