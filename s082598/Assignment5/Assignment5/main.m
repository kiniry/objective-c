//
//  main.m
//  Assignment5
//
//  Created by Jonas Eriksen on 01/02/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Random.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Initialize and use Random instance without specified seed
        Random *rnd = [Random new];
        
        NSLog(@"%i",[rnd randomBool]);
        NSLog(@"%i",[rnd randomInt]);
        
        
        // Initialize and use Random instance with specified seed (using one class factory method)
        Random *rnd2 = [Random newWithSeed:0xDF938BEDAL];
        
        NSLog(@"%i",[rnd2 randomIntBelowInt:6942]);
        NSLog(@"%li",[rnd2 randomLong]);
        
        
        // Use of class factory methods (singleton)
        NSLog(@"%f",[Random randomFloat]);
        NSLog(@"%f",[Random randomDouble]);

        
    }
    return 0;
}

