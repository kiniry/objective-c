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

@property(nonatomic, copy) NSString* accesToken;
@property(nonatomic, copy) NSString* identifier;
@property(nonatomic, strong) Auth* auth;

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


-(void)fetch:(NSString*)secretOrNil
{
    if (!self.auth) self.auth = [[Auth alloc] init];
    
    if (secretOrNil) {
        
    } else {
        NSDictionary *data = [self.auth loadPublicInfoUsingIdentifier:self.identifier];
        [self handleData:data];
    }
}

-(void) handleData:(NSDictionary*)data
{
    //Only used by subclasses
}

@end
