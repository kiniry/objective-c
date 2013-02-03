//
//  Auth.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Auth : NSObject

-(NSString *)loadAccessTokenUsingClientId:(NSString *)identifier andSecret:(NSString *)secret;

-(NSDictionary *)loadPublicInfoUsingIdentifier:(NSString *)identifier;

-(NSDictionary *)loadPrivateInfoUsingIdentifier:(NSString *)identifier accessToken:(NSString *)accessToken andAttributes:(NSString *)attributes;

@end
