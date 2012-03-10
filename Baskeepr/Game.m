//
//  Game.m
//  Baskeepr
//
//  Created by andy on 12/1/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize gameDate, opponentName, opponentScore, gameResults;

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.gameDate forKey:@"gameDate"];
    [aCoder encodeObject:self.opponentName forKey:@"opponentName"];
    [aCoder encodeObject:self.opponentScore forKey:@"opponentScore"];
    [aCoder encodeObject:self.gameResults forKey:@"gameResults"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        
        self.gameDate=[aDecoder decodeObjectForKey:@"gameDate"];
        self.opponentName=[aDecoder decodeObjectForKey:@"opponentName"];
        self.opponentScore=[aDecoder decodeObjectForKey:@"opponentScore"];
        self.gameResults=[aDecoder decodeObjectForKey:@"gameResults"];
        
    }
    return self;
}
@end
