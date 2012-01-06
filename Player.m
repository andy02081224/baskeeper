//
//  Player.m
//  Baskeepr
//
//  Created by andy on 12/1/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize name, number, height, weight;

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.number forKey:@"number"];
    [aCoder encodeObject:self.height forKey:@"height"];
    [aCoder encodeObject:self.weight forKey:@"weight"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.number=[aDecoder decodeObjectForKey:@"number"];
        self.height=[aDecoder decodeObjectForKey:@"height"];
        self.weight=[aDecoder decodeObjectForKey:@"weight"];
    }
    return self;
}

@end
