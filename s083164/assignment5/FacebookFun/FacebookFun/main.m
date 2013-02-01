//
//  main.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Application.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Application  *a = [[Application alloc] initWithClientId:@"400085286748513"];
        
        [a fetch:nil];
        
        NSLog(@"%@", a.appDescription);
        NSLog(@"%@", a.link);
        
    }
    return 0;
}

