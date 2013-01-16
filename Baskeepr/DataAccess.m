//
//  DataAccess.m
//  iQ
//
//  Created by  on 12/7/23.
//  Copyright (c) 2012年 NCCU. All rights reserved.
//

#import "DataAccess.h"
#import "BoxScore.h"
#import "Room.h"
#import "Stats.h"
#define Server @"http://140.119.19.44/Baskeeper/baskeeperServerAPI.php"

static DataAccess *instance=nil;
@implementation DataAccess

#pragma mark Singleton Methods
+(id)sharedInstance{
    if(instance == nil)
        instance = [[DataAccess alloc]init];
    return instance;
}

#pragma mark Methods
-(NSDictionary *) saveBoxscore:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"saveBoxscore" forKey:@"statement"];
    [request setPostValue:[infoDic objectForKey:@"Boxscore"] forKey:@"Boxscore"];
    [request startSynchronous];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToGeneral:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;
}
-(NSDictionary *) saveGame:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:[infoDic objectForKey:@"saveGame"] forKey:@"statement"];
    [request setPostValue:[infoDic objectForKey:@"game_hometeam_name"] forKey:@"game_hometeam_name"];
    [request setPostValue:[infoDic objectForKey:@"game_awayteam_name"] forKey:@"game_awayteam_name"];
    [request setPostValue:[infoDic objectForKey:@"game_home_score"] forKey:@"game_home_score"];
    [request setPostValue:[infoDic objectForKey:@"game_away_score"] forKey:@"game_away_score"];
    [request startSynchronous];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToGeneral:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;
}
-(NSDictionary *) createRoom:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:[infoDic objectForKey:@"createRoom"] forKey:@"statement"];
    [request setPostValue:[infoDic objectForKey:@"r_name"] forKey:@"r_name"];
    [request setPostValue:[infoDic objectForKey:@"r_password"] forKey:@"r_password"];
    [request setPostValue:[infoDic objectForKey:@"r_home_token"] forKey:@"r_home_token"];
    [request startSynchronous];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToGeneral:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;
}
-(NSDictionary *) getRoom:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:[infoDic objectForKey:@"getRoom"] forKey:@"statement"];
    [request startSynchronous];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToRoom:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;
}
-(NSDictionary *) joinRoom:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:[infoDic objectForKey:@"joinRoom"] forKey:@"statement"];
    [request setPostValue:[infoDic objectForKey:@"r_id"] forKey:@"r_id"];
    [request setPostValue:[infoDic objectForKey:@"r_away_token"] forKey:@"r_away_token"];
    [request startSynchronous];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToRoom:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;
}

-(NSDictionary *) loadBoxscore:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:[infoDic objectForKey:@"loadBoxscore"] forKey:@"statement"];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToGeneral:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;
}
-(NSDictionary *) loadGame:(NSMutableDictionary *)infoDic{
    NSDictionary *response;
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:[infoDic objectForKey:@"loadGame"] forKey:@"statement"];
    response=[NSDictionary dictionaryWithDictionary:[self jsonParseToStats:[request responseData]]];
    NSLog(@"%@",[request responseString]);
    return response;

}
#pragma mark JSON Parser Methods
-(NSDictionary *)jsonParseToRoom:(NSData *)responseData{
    NSMutableDictionary *response=[[NSMutableDictionary alloc]init];
    NSError* error;
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData
                     options:kNilOptions
                     error:&error];
    NSMutableArray *listRoom = [[NSMutableArray alloc]init];
    for(int i = 0;i<[json count];i++){
        NSDictionary *dic=[json objectAtIndex:i];
        Room *r=[[Room alloc]init];
        r.r_id=[dic objectForKey:@"r_id"];
        r.r_name=[dic objectForKey:@"r_name"];
        r.r_password=[dic objectForKey:@"r_password"];
        r.r_home_token=[dic objectForKey:@"r_home_token"];
        [listRoom addObject:r];
    }
    [response setObject:listRoom forKey:@"listRoom"];
    NSString *log=[NSString stringWithFormat:@"%d rooms from server.",[listRoom count]];
    [response setObject:log forKey:@"log"];
    return response;
}
-(NSDictionary *)jsonParseToStats:(NSData *)responseData{
    NSMutableDictionary *response=[[NSMutableDictionary alloc]init];
    NSError* error;
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData
                     options:kNilOptions
                     error:&error];
    NSMutableArray *listStats = [[NSMutableArray alloc]init];
    for(int i = 0;i<[json count];i++){
        NSDictionary *dic=[json objectAtIndex:i];
        Stats *s=[[Stats alloc]init];
        s.game_away_score=[dic objectForKey:@"game_away_score"];
        s.game_awayteam_name=[dic objectForKey:@"game_awayteam_name"];
        s.game_home_score=[dic objectForKey:@"game_home_score"];
        s.game_hometeam_name=[dic objectForKey:@"game_hometeam_name"];
        s.game_id=[dic objectForKey:@"r_game_idid"];
        s.game_place=[dic objectForKey:@"game_place"];
        [listStats addObject:s];
    }
    [response setObject:listStats forKey:@"listStats"];
    NSString *log=[NSString stringWithFormat:@"%d stats from server.",[listStats count]];
    [response setObject:log forKey:@"log"];
    return response;
}
-(NSDictionary *)jsonParseToBoxScore:(NSData *)responseData{
    NSMutableDictionary *response=[[NSMutableDictionary alloc]init];
    NSError* error;
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData
                     options:kNilOptions
                     error:&error];
    NSMutableArray *listBoxScore = [[NSMutableArray alloc]init];
    for(int i = 0;i<[json count];i++){
        NSDictionary *dic=[json objectAtIndex:i];
        BoxScore *b=[[BoxScore alloc]init];
        b.game_id=[dic objectForKey:@"game_id"];
        b.boxscore_id=[dic objectForKey:@"boxscore_id"];
        b.player_assists=[dic objectForKey:@"player_assists"];
        b.player_blockshot=[dic objectForKey:@"player_blockshot"];
        b.player_defensive_rebound=[dic objectForKey:@"player_defensive_rebound"];
        b.player_freethrow_a=[dic objectForKey:@"player_freethrow_a"];
        b.player_freethrow_m=[dic objectForKey:@"player_freethrow_m"];
        b.player_number=[dic objectForKey:@"player_number"];
        b.player_offensive_rebound=[dic objectForKey:@"player_offensive_rebound"];
        b.player_pfoul=[dic objectForKey:@"player_pfoul"];
        b.player_position=[dic objectForKey:@"player_position"];
        b.player_steal=[dic objectForKey:@"player_steal"];
        b.player_threeopoint_hit=[dic objectForKey:@"player_threeopoint_hit"];
        b.player_threeopoint_shoot=[dic objectForKey:@"player_threeopoint_shoot"];
        b.player_turnover=[dic objectForKey:@"player_turnover"];
        b.player_twopoint_hit=[dic objectForKey:@"player_twopoint_hit"];
        b.player_twopoint_shoot=[dic objectForKey:@"player_twopoint_shoot"];
        [listBoxScore addObject:b];
    }
    [response setObject:listBoxScore forKey:@"listBoxScore"];
    NSString *log=[NSString stringWithFormat:@"%d BoxScores from server.",[listBoxScore count]];
    [response setObject:log forKey:@"log"];
    return response;
}

-(NSDictionary *)jsonParseToGeneral:(NSData *)responseData{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    return json;
}

-(void) test:(NSString *)token{
    NSURL *url=[NSURL URLWithString:Server];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"test" forKey:@"statement"];
    [request setPostValue:token forKey:@"token"];
    [request startSynchronous];
    NSLog(@"%@",[request responseString]);
}


@end
