//
//  Auth.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Auth.h"

@implementation Auth

-(NSString *)loadAccessTokenUsingClientId:(NSString *)identifier andSecret:(NSString *)secret error:(NSError **)error
{
    NSString *URL = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/access_token?client_id=%@&client_secret=%@&grant_type=client_credentials",identifier, secret];
    NSString *data = [NSString stringWithContentsOfURL:[NSURL URLWithString: URL] encoding:NSUTF8StringEncoding error:error];
    return data;
}

-(NSDictionary *)loadPublicInfoUsingIdentifier:(NSString *)identifier error:(NSError **)error
{
    NSString *stringURL =[NSString stringWithFormat:@"https://graph.facebook.com/%@",identifier];
    NSString* webStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:webStringURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:error];
    
    if (!data) {
        return nil;
    }
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:error];
    
    return dict;
}

-(NSDictionary *)loadPrivateInfoUsingIdentifier:(NSString *)identifier accessToken:(NSString *)accessToken andAttributes:(NSString *)attributes error:(NSError **)error
{
 
    NSString *stringURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@?fields=%@&%@",identifier,attributes,accessToken];
    NSString* webStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* url = [NSURL URLWithString:webStringURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if (!data) {
        return nil;
    }
    
    NSError *dictError;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&dictError];
    
    return dict;
}

@end
