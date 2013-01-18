//
//  main.m
//  Assignment3-Defensive
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Citizen *Peter = [[Citizen alloc]initWithName:@"Peter" withSex:@"Male" withAge:@10];
        Citizen *Hans = [[Citizen alloc]initWithName:@"Hans" withSex:@"Male" withAge:@20];
        Citizen *Gitte = [[Citizen alloc]initWithName:@"Gitte" withSex:@"Female" withAge:@10];
        Citizen *Franz = [[Citizen alloc]initWithName:@"Franz" withSex:@"Male" withAge:@30];
        Citizen *Jenny = [[Citizen alloc]initWithName:@"Jenny" withSex:@"Female" withAge:@15];
        //[Peter canMarry:nil]; - Exception
        [Gitte canMarry:nil];
        [Hans addChild:Peter];
        NoblePerson *QueenMargrethe = [[NoblePerson alloc]initWithName:@"Queen Margrethe" withSex:@"Female" withAge:@90 withAssets:5000000];
    }
    return 0;
}

