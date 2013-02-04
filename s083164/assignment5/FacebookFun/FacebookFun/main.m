//
//  main.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Application.h"
#import "Page.h"
#import "User.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSError *error;
        
        Application  *a = [[Application alloc] initWithClientId:@"400085286748513"];
        
        NSString *s = [a getAccessTokenUsingSecret:@"5e7598112f87d2c6fd0d9bdec0c2e300" error:&error];
        
        [a fetchUsingAccessTokenOrNil:s error:&error];
        
        NSLog(@"%@",a.contactEmail);
        
        Page *p = [[Page alloc] initWithClientId:@"107769355913182"];
        
        [p fetchUsingAccessTokenOrNil:nil error:&error];
        
        NSLog(@"%@",p.name);
        
        User *u = [[User alloc] initWithClientId:@"klarskov"];
        
        [u fetchUsingAccessTokenOrNil:nil error:&error];
        
        NSLog(@"%@",u.username);
        
        
    }
    return 0;
}

