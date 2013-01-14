//
//  main.m
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *c = [[Citizen alloc] initWithName:@"John Doe" AndAge:40 AndSex:M];
        
        NSLog(@"%@", c);
        
    }
    return 0;
}