//
//  Node.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Node.h"
#import "Auth.h"

@interface Node ()

//@property(nonatomic, copy) NSString* accesToken;
@property(nonatomic, copy) NSString* identifier;
@property(nonatomic, strong) Auth* auth;
@property(nonatomic, strong) NSArray* attributes;

@end

@implementation Node

-(id)initWithClientId:(NSString *)identifier
{
    self = [super init];
    
    if (self) {
        _identifier = identifier;
    }
    return self;
}

-(id)initWithClientId:(NSString *)identifier andClientSecret:(NSString *)secret
{
    self = [super init];
    
    if (self) {
        _identifier = identifier;
        _secret = secret;
    }
    return self;
}


-(void)fetchUsingAccessTokenOrNil:(NSString*)accessTokenOrNil
{
    if (!self.auth) self.auth = [[Auth alloc] init];
    if (!self.attributes) [self initAttributes];
    
    if (!self.identifier) {
        [NSException raise:@"No identifier provided" format:@"Please provide an identifier for your node"];
    }
    
    if (accessTokenOrNil) {
        
        NSDictionary *data = [self.auth loadPrivateInfoUsingIdentifier:self.identifier andAccessToken:accessTokenOrNil];
        [self handleData:data];
        
        
    } else {
        NSDictionary *data = [self.auth loadPublicInfoUsingIdentifier:self.identifier];
        [self handleData:data];
    }
}

-(NSString *)getAccessTokenUsingSecret:(NSString *)secret
{
    return [self.auth loadAccessTokenUsingClientId:self.identifier andSecret:self.secret];
}

//Only used by subclasses
-(void) handleData:(NSDictionary*)data
{
    
}

//Only used by subclasses
-(void) initAttributes
{
    
}

@end
