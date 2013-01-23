//
//  main.m
//  assignment3
//
//  Created by Joachim on 22/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "CitizenAssert.h"
#import "CitizenLog.h"
#import "CitizenDefensive.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        //Assertion
        /*CitizenAssert *citizenBob = [[CitizenAssert alloc] initWithName:@"Bob" andAge:30 andSex:male];
        CitizenAssert *citizenAlice = [[CitizenAssert alloc] initWithName:@"Alice" andAge:28 andSex:female];
        [citizenBob marry:citizenBob]; //not possible
        [citizenBob marry:citizenAlice];
        CitizenAssert *citizenToby = [[CitizenAssert alloc] initWithName:@"Toby" andAge:10 andSex:male];
        [citizenBob addChild:citizenToby];
        [citizenAlice addChild:citizenBob]; //not possible
        [citizenAlice addChild:citizenToby];
        NSLog(@"%@\n%@\n%@\n",citizenBob,citizenAlice,citizenToby);*/
        
        //Logging
        /*CitizenLog *citizenBob = [[CitizenLog alloc] initWithName:@"Bob" andAge:30 andSex:male];
        CitizenLog *citizenAlice = [[CitizenLog alloc] initWithName:@"Alice" andAge:28 andSex:female];
        [citizenBob marry:citizenBob]; //not possible
        [citizenBob marry:citizenAlice];
        CitizenLog *citizenToby = [[CitizenLog alloc] initWithName:@"Toby" andAge:10 andSex:male];
        [citizenBob addChild:citizenToby];
        [citizenAlice addChild:citizenBob]; //not possible
        [citizenAlice addChild:citizenToby];
        NSLog(@"%@\n%@\n%@\n",citizenBob,citizenAlice,citizenToby);*/
        
        //Defensive
        CitizenDefensive *citizenBob = [[CitizenDefensive alloc] initWithName:@"Bob" andAge:30 andSex:male];
        CitizenDefensive *citizenAlice = [[CitizenDefensive alloc] initWithName:@"Alice" andAge:28 andSex:female];
        [citizenBob marry:citizenBob]; //not possible
        [citizenBob marry:citizenAlice];
        CitizenDefensive *citizenToby = [[CitizenDefensive alloc] initWithName:@"Toby" andAge:10 andSex:male];
        [citizenBob addChild:citizenToby];
        [citizenAlice addChild:citizenBob]; //not possible
        [citizenAlice addChild:citizenToby];
        NSLog(@"%@\n%@\n%@\n",citizenBob,citizenAlice,citizenToby);
    }
    return 0;
}
