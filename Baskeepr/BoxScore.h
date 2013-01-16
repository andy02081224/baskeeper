//
//  BoxScore.h
//  BaskeeperOnline
//
//  Created by MrEJ on 13/1/16.
//
//

#import <Foundation/Foundation.h>

@interface BoxScore : NSObject
@property (retain,nonatomic) NSString *boxscore_id;
@property (retain,nonatomic) NSString *game_id;
@property (retain,nonatomic) NSString *player_number;
@property (retain,nonatomic) NSString *player_position;
@property (retain,nonatomic) NSString *player_twopoint_shoot;
@property (retain,nonatomic) NSString *player_twopoint_hit;
@property (retain,nonatomic) NSString *player_threeopoint_shoot;
@property (retain,nonatomic) NSString *player_threeopoint_hit;
@property (retain,nonatomic) NSString *player_offensive_rebound;
@property (retain,nonatomic) NSString *player_defensive_rebound;
@property (retain,nonatomic) NSString *player_assists;
@property (retain,nonatomic) NSString *player_steal;
@property (retain,nonatomic) NSString *player_blockshot;
@property (retain,nonatomic) NSString *player_pfoul;
@property (retain,nonatomic) NSString *player_turnover;
@property (retain,nonatomic) NSString *player_freethrow_m;
@property (retain,nonatomic) NSString *player_freethrow_a;


@end
