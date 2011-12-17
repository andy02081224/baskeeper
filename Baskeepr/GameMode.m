//
//  GameMode.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameMode.h"

@implementation GameMode
@synthesize time;
@synthesize period;
@synthesize foul;
@synthesize timeout;

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super init])) {
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.period = [aDecoder decodeObjectForKey:@"period"];
        self.foul=[aDecoder decodeObjectForKey:@"foul"];
        self.timeout=[aDecoder decodeObjectForKey:@"timout"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.period forKey:@"period"];
    [aCoder encodeObject:self.foul forKey:@"foul"];
    [aCoder encodeObject:self.timeout forKey:@"timeout"];

}

@end
