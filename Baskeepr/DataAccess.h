//
//  DataAccess.h
//  iQ
//
//  Created by  on 12/7/23.
//  Copyright (c) 2012年 NCCU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface DataAccess : NSObject

//Singleton Methods
+(id) sharedInstance;

//Methods
-(NSDictionary *) saveBoxscore:(NSMutableDictionary *)infoDic;
-(NSDictionary *) saveGame:(NSMutableDictionary *)infoDic;
-(NSDictionary *) createRoom:(NSMutableDictionary *)infoDic;
-(NSDictionary *) getRoom:(NSMutableDictionary *)infoDic;
-(NSDictionary *) joinRoom:(NSMutableDictionary *)infoDic;
-(NSDictionary *) loadBoxscore:(NSMutableDictionary *)infoDic;
-(NSDictionary *) loadGame:(NSMutableDictionary *)infoDic;
-(void) test:(NSString *)token;

//JSON Parser Methods
-(NSDictionary *)jsonParseToBoxScore:(NSData *)responseData;
-(NSDictionary *)jsonParseToStats:(NSData *)responseData;
-(NSDictionary *)jsonParseToRoom:(NSData *)responseData;
-(NSDictionary *)jsonParseToGeneral:(NSData *)responseData;
@end
