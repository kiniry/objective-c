//
//  main.m
//  assignment2
//
//  Created by Radu Gatej on 1/13/13.
//  Copyright (c) 2013 Radu Gatej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
       // NSLog(@"Hello, World!");
        
        Citizen *george = [[Citizen alloc] init:@"George Jetson" sex:MALE age:34];
        Citizen *jane = [[Citizen alloc] init:@"Jane Jetson" sex:FEMALE age:33];
        [george marry:jane];
        Citizen *elroy = [[Citizen alloc] init:@"Elroy Jetson" sex:MALE age:6];
        Citizen *judy = [[Citizen alloc] init:@"Judy Jetson" sex:FEMALE age:15];
        george.children = [NSArray arrayWithObjects:elroy,judy, nil];
        jane.children = george.children;
        elroy.parents = [NSArray arrayWithObjects:jane,george, nil];
        judy.parents = elroy.parents;
        NSLog(george.name);
        
        
    }
    return 0;
}

