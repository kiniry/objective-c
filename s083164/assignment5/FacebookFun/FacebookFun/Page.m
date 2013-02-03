//
//  Page.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Page.h"

@implementation Page

static NSString *const EKKAccessPageName = @"name";
static NSString *const EKKAccessPageDescription = @"description";
static NSString *const EKKAccessPageLink = @"link";
static NSString *const EKKAccessPageCategory = @"category";

-(void) handleData:(NSDictionary*)data
{
    
    //    if ([data objectForKey:]) self. = [data objectForKey:];
    
    //    Public facebook properties
    if ([data objectForKey:EKKAccessPageName]) self.name = [data objectForKey:EKKAccessPageName];
    if ([data objectForKey:EKKAccessPageDescription]) self.pageDescription = [data objectForKey:EKKAccessPageDescription];
    if ([data objectForKey:EKKAccessPageLink]) self.link = [data objectForKey:EKKAccessPageLink];
    if ([data objectForKey:EKKAccessPageCategory]) self.category = [data objectForKey:EKKAccessPageCategory];
    
    
}

@end
