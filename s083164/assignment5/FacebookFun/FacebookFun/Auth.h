//
//  Auth.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Auth : NSObject

-(NSString *)loadAccessTokenUsingClientId:(NSString *)identifier andSecret:(NSString *)secret error:(NSError **)error;

-(NSDictionary *)loadPublicInfoUsingIdentifier:(NSString *)identifier error:(NSError **)error;

-(NSDictionary *)loadPrivateInfoUsingIdentifier:(NSString *)identifier accessToken:(NSString *)accessToken andAttributes:(NSString *)attributes error:(NSError **)error;

@end
