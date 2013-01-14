//
//  main.m
//  assignment2
//
//  Created by Anders Emil Nielsen on 10/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *sweetiepie = [[Citizen alloc] initWithName: @"Lola" andSex: female andAge:@25];
        Citizen *child = [[Citizen alloc] initWithName:@"Frede" andSex:male andAge:@5];
        Citizen *child2 = [[Citizen alloc] initWithName:@"Henrik" andSex:male andAge:@2];
        Citizen *father = [[Citizen alloc] initWithName: @"Bent" andSex: male andAge:@50];
        Citizen *mother = [[Citizen alloc] initWithName: @"Kirsten" andSex: female andAge:@45];
        Citizen *citizen = [[Citizen alloc] initWithName: @"Carl" andSex: male andAge:@30];
        [father makeChild:citizen withParent:mother];
        [citizen marry: sweetiepie];
        [citizen makeChild:child withParent:citizen.spouse];
        [citizen makeChild:child2 withParent:citizen.spouse];
        NSLog(@"%@", citizen);

        NoblePerson *lord = [[NoblePerson alloc] initWithName: @"Lord Nelson" andSex: male andAge:@60];
        NoblePerson *princess = [[NoblePerson alloc] initWithName:@"Princess Maria" andSex:female andAge:@30];
        [lord setButler:citizen];
        [lord setAssets:@1025000];
        [princess setAssets:@1025000];
        [father makeChild:lord withParent:mother];
        [lord marry:princess];
        NSLog(@"%@", lord);
    }
    return 0;
}

