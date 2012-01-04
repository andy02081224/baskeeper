//
//  playerStats.m
//  Baskeepr
//
//  Created by andy on 11/12/27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "playerStats.h"

@implementation playerStats

@synthesize statsNumber, statsPosition, statsFGA, statsFGM, stats3PA, stats3PM,statsFTA, statsFTM, statsDefReb, statsOffReb, statsAST, statsPF, statsST,statsTO, statsBS;

//save
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.statsNumber forKey:@"statsNumber"]; 
    [aCoder encodeObject:self.statsPosition forKey:@"statsPosition"];
    [aCoder encodeObject:self.statsFGA forKey:@"statsFGA"];
    [aCoder encodeObject:self.statsFGM forKey:@"statsFGM"];
    [aCoder encodeObject:self.stats3PA forKey:@"stats3PA"];
    [aCoder encodeObject:self.stats3PM forKey:@"stats3PM"];
    [aCoder encodeObject:self.statsFTA forKey:@"statsFTA"];
    [aCoder encodeObject:self.statsFTM forKey:@"statsFTM"];
    [aCoder encodeObject:self.statsDefReb forKey:@"statsDefReb"];
    [aCoder encodeObject:self.statsOffReb forKey:@"statsOffReb"];
    [aCoder encodeObject:self.statsAST forKey:@"statsAST"];
    [aCoder encodeObject:self.statsPF forKey:@"statsPF"];
    [aCoder encodeObject:self.statsST forKey:@"statsST"];
    [aCoder encodeObject:self.statsTO forKey:@"statsTO"];
    [aCoder encodeObject:self.statsBS forKey:@"statsBS"];
}

//load
-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self=[super init])){
        self.statsNumber=[aDecoder decodeObjectForKey:@"statsNumber"];
        self.statsPosition=[aDecoder decodeObjectForKey:@"statsPosition"];
        self.statsFGA=[aDecoder decodeObjectForKey:@"statsFGA"];
        self.statsFGM=[aDecoder decodeObjectForKey:@"statsFGM"];
        self.stats3PA=[aDecoder decodeObjectForKey:@"stats3PA"];
        self.stats3PM=[aDecoder decodeObjectForKey:@"stats3PM"];
        self.statsFTA=[aDecoder decodeObjectForKey:@"statsFTA"];
        self.statsFTM=[aDecoder decodeObjectForKey:@"statsFTM"];
        self.statsDefReb=[aDecoder decodeObjectForKey:@"statsDefReb"];
        self.statsOffReb=[aDecoder decodeObjectForKey:@"statsOffReb"];
        self.statsAST=[aDecoder decodeObjectForKey:@"statsAST"];
        self.statsPF=[aDecoder decodeObjectForKey:@"statsPF"];
        self.statsST=[aDecoder decodeObjectForKey:@"statsST"];
        self.statsTO=[aDecoder decodeObjectForKey:@"statsTO"];
        self.statsBS=[aDecoder decodeObjectForKey:@"statsBS"];
    }
    return self;
}





@end
