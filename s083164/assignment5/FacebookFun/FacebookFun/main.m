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
        
        
//        We can create an application that represents a facebook application. We initialize it with its id.
        Application  *a = [[Application alloc] initWithClientId:@"400085286748513"];
        
//        The accesstoken would normally be retrieved from somewhere else. And the secret would not be hardcoded. But this is strictly for demonstration purposes. So we use the dummy applications secret to get the accesstoken.
        NSString *s = [a getAccessTokenUsingSecret:@"5e7598112f87d2c6fd0d9bdec0c2e300" error:&error];
        
//        We now have an accesstoken and can use it to fetch data including private stuff.
        [a fetchUsingAccessTokenOrNil:s error:&error];
       
//        Our application object has now been populated with the data representing the facebook app.
        NSLog(@"%@",a.name);
        NSLog(@"%@",a.link);
        NSLog(@"%@",a.authDialogHeadline);
        NSLog(@"%@",a.appDescription);
        NSLog(@"%@",a.contactEmail);
        NSLog(@"%@",a.authDialogPermsExplanation);
        
//        Facebook pages are represented as Page objects.
        Page *p = [[Page alloc] initWithClientId:@"107769355913182"];
        
//        If we dont provide the fetch method with an accesstoken it will only fetch the public stuff
        [p fetchUsingAccessTokenOrNil:nil error:&error];
        
        NSLog(@"%@",p.name);
        NSLog(@"%@",p.pageDescription);
        NSLog(@"%@",p.link);
        NSLog(@"%@",p.category);
        
//        Last but not the least, Users
        User *u = [[User alloc] initWithClientId:@"klarskov"];
        
        [u fetchUsingAccessTokenOrNil:nil error:&error];
        
        NSLog(@"%@",u.username);
        
        
    }
    return 0;
}

