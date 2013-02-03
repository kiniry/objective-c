//
//  Node.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property(nonatomic, copy) NSString* secret;

-(id)initWithClientId:(NSString *)identifier;

-(id)initWithClientId:(NSString *)identifier andClientSecret:(NSString *)secret;

-(void)fetchUsingAccessTokenOrNil:(NSString*)accessTokenOrNil;

-(NSString *)getAccessTokenUsingSecret:(NSString *)secret;

@end

//To indicate that this is only used by subclasses
@interface Node (Protected)

-(void) handleData:(NSDictionary*)data;

-(void) initAttributes;

@end
