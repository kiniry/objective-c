//
//  main.m
//  Assignment3-Assertion
//
//  Created by Markus Færevaag on 22.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Dummies
        Citizen *c1 = [[Citizen alloc] initWithName:@"Markus Færevaag" andSex:Male andAge:21];
        Citizen *c2 = [[Citizen alloc] initWithName:@"Annicken Bruu" andSex:Female andAge:21];
        Citizen *c3 = [[Citizen alloc] initWithName:@"Ellen Veie" andSex:Female andAge:61];
        Citizen *c4 = [[Citizen alloc] initWithName:@"Arne Færevaag" andSex:Male andAge:59];
        
        [c1 marry:c2];
        [c3 marry:c4];
        
        [c1 addParent:c3];
        [c1 addParent:c4];
        
        [c1 divorce:c2];
        
    }
    return 0;
}

