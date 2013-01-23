//
//  main.m
//  assignment2
//
//  Created by Joachim on 16/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        Citizen *citizenBob = [[Citizen alloc] initWithName:@"Bob" andAge:30 andSex:male];
        Citizen *citizenAlice = [[Citizen alloc] initWithName:@"Alice" andAge:28 andSex:female];
        [citizenBob marry:citizenBob]; //not possible to marry self
        [citizenBob marry:citizenAlice];
        Citizen *citizenToby = [[Citizen alloc] initWithName:@"Toby" andAge:10 andSex:male];
        [citizenBob addChild:citizenToby];
        [citizenAlice addChild:citizenBob]; //not possible to have spouse as child
        [citizenAlice addChild:citizenToby];
        
        NoblePerson *nobleBob = [[NoblePerson alloc] initWithName:@"Lord Bob" andAge:40 andSex:male];
        NoblePerson *nobleAlice = [[NoblePerson alloc] initWithName:@"Miss Alice" andAge:35 andSex:female];
        [nobleBob marry:nobleAlice];
        nobleBob.butler = citizenBob;
        nobleBob.assets = 100000;
        nobleAlice.assets = 100000;
        [nobleBob marry:nobleAlice];
        NSLog(@"%@\n%@\n%@\n%@\n%@\n",citizenBob,citizenAlice,citizenToby,nobleBob,nobleAlice);
    }
    return 0;
}
