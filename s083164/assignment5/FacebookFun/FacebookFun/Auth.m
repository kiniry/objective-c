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
    NSString *stringURL =[NSString stringWithFormat:@"https://graph.facebook.com/%@",identifier];
    NSString* webStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:webStringURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    return dict;
}

-(NSDictionary *)loadPrivateInfoUsingIdentifier:(NSString *)identifier accessToken:(NSString *)accessToken andAttributes:(NSString *)attributes
{
 
    NSString *stringURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@?fields=%@&%@",identifier,attributes,accessToken];
    NSString* webStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:webStringURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    return dict;
}

@end
