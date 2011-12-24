//
//  GameMode.m
//  Baskeepr
//
//  Created by andy on 11/12/17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameMode.h"

@implementation GameMode
@synthesize homeName;
@synthesize guestName;
@synthesize time;
@synthesize period;
@synthesize foul;
@synthesize timeOutLeft;

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.homeName forKey:@"homeName"];
    [aCoder encodeObject:self.guestName forKey:@"guestName"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.period forKey:@"period"];
    [aCoder encodeObject:self.foul forKey:@"foul"];
    [aCoder encodeObject:self.timeOutLeft forKey:@"timeout"];

}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super init])) {
        self.homeName=[aDecoder decodeObjectForKey:@"homeName"];
        self.guestName=[aDecoder decodeObjectForKey:@"guestName"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.period = [aDecoder decodeObjectForKey:@"period"];
        self.foul=[aDecoder decodeObjectForKey:@"foul"];
        self.timeOutLeft=[aDecoder decodeObjectForKey:@"timout"];
    }
    return self;
}



@end
