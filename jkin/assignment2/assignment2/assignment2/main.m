//
//  main.m
//  assignment2
//
//  Created by Joseph Kiniry on 11/1/2013.
//  Copyright (c) 2013 Joseph Kiniry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Citizen *joe = [[Citizen alloc] init:@"Joe Kiniry" sex: MALE age:42];
        Citizen *genevieve = [[Citizen alloc] init:@"Genevieve Fu" sex: FEMALE age:42];
        [joe marry:genevieve];
        Citizen *an = [[Citizen alloc] init:@"An Kiniry" sex: FEMALE age:3];
        Citizen *noomi = [[Citizen alloc] init:@"Noomi Fu" sex: FEMALE age:0];
        joe.children = [NSSet setWithObjects:an, noomi, nil];
        genevieve.children = joe.children;
        an.parents = [NSSet setWithObjects:joe, genevieve, nil];
        noomi.parents = an.parents;
        [joe invariant];
        [genevieve invariant];
        [an invariant];
        [noomi invariant];
        NoblePerson *np = [[NoblePerson alloc] init:@"King George" sex:MALE age:60
                           assets:1e+10 butler:joe];
        NSLog(@"Joe is %@", joe);
        NSLog(@"The king is %@", np);
        
    }
    return 0;
}

