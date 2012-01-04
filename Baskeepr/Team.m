//
//  Team.m
//  Baskeepr
//
//  Created by andy on 11/12/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Team.h"

@implementation Team
@synthesize name;
@synthesize location;
@synthesize coach;
@synthesize captain;
@synthesize introduction;

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.location forKey:@"phoneNumber"];
    [aCoder encodeObject:self.coach forKey:@"coach"];
    [aCoder encodeObject:self.captain forKey:@"captain"];
    [aCoder encodeObject:self.introduction forKey:@"introduction"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.location=[aDecoder decodeObjectForKey:@"location"];
        self.coach=[aDecoder decodeObjectForKey:@"coach"];
        self.captain=[aDecoder decodeObjectForKey:@"caption"];
        self.introduction=[aDecoder decodeObjectForKey:@"introduction"];
    }
    return self;
}



@end

