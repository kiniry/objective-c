//
//  main.m
//  Assignment2-1
//
//  Created by David Harboe on 1/10/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *citizen = [[Citizen alloc] initWithName: @"Morten"];
        [citizen setSex: male];
        [citizen setAge: @18];
        [citizen setRelationshipStatus: single];
        NSLog(@"%@", citizen);
        
        NoblePerson *noblePerson = [[NoblePerson alloc] initWithName: @"Gert"];
        [noblePerson setSex: male];
        [noblePerson setAge: @18];
        [noblePerson setRelationshipStatus: itIsComplicated];
        [noblePerson setAssets: @14000];
        [noblePerson setButler: @"Hans"];
        NSLog(@"%@", noblePerson);
    }
    return 0;
}

