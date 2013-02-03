//
//  Auth.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Auth.h"

@implementation Auth

-(NSString *)loadAccessTokenUsingClientId:(NSString *)identifier andSecret:(NSString *)secret
{
    NSString *URL = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/access_token?client_id=%@&client_secret=%@&grant_type=client_credentials",identifier, secret];

    NSError *error;
    
    NSString *data = [NSString stringWithContentsOfURL:[NSURL URLWithString: URL] encoding:NSUTF8StringEncoding error:&error];
    
    return data;
}

-(NSDictionary *)loadPublicInfoUsingIdentifier:(NSString *)identifier
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@",identifier]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    return dict;
}

-(NSDictionary *)loadPrivateInfoUsingIdentifier:(NSString *)identifier andAccessToken:(NSString *)accessToken
{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@?fields=&access_token=%@",identifier,accessToken]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    return dict;
}

@end
