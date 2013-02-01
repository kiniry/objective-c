//
//  Application.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Application.h"

static NSString *const EKKAccessAppName = @"name";
static NSString *const EKKAccessAppDescription = @"description";
static NSString *const EKKAccessAppLink = @"link";
static NSString *const EKKAccessAppIconURL = @"icon_url";
static NSString *const EKKAccessAppLogoURL = @"logo_url";
static NSString *const EKKAccessAppDailyActiveUsers = @"daily_active_users";

@implementation Application

-(void) handleData:(NSDictionary*)data
{
    NSLog(@"%@", data);
    
    //Very ugly.
    if ([data objectForKey:EKKAccessAppName]) self.name = [data objectForKey:EKKAccessAppName];
    if ([data objectForKey:EKKAccessAppDescription]) self.appDescription = [data objectForKey:EKKAccessAppDescription];
    if ([data objectForKey:EKKAccessAppLink]) self.link = [data objectForKey:EKKAccessAppLink];
    if ([data objectForKey:EKKAccessAppIconURL]) self.iconURL = [data objectForKey:EKKAccessAppIconURL];
    if ([data objectForKey:EKKAccessAppLogoURL]) self.logoURL = [data objectForKey:EKKAccessAppLogoURL];
    if ([data objectForKey:EKKAccessAppLogoURL]) self.logoURL = [data objectForKey:EKKAccessAppLogoURL];

}

@end
