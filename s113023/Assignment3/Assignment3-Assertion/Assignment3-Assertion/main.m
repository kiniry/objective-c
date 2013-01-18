//
//  main.m
//  Assignment3-Assertion
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
        NSLog(@"Hello, World!");
        
        Citizen *Per = [[Citizen alloc] initWithName:@"Per" withSex:@"Male" withAge:@20];
        Citizen *Gitte = [[Citizen alloc] initWithName:@"Gitte" withSex:@"Female" withAge:@30];
        Citizen *Hans = [[Citizen alloc] initWithName:@"Hans" withSex:@"Male" withAge:@15];
        [Per addChild:Hans];
        [Per addChild:Gitte];
        [Gitte addChild:Hans];
        
        
        NSLog(@"%@",Per.single);
        NSLog(@"%@",Gitte.single);
        NSLog(@"%@",Hans.single);
        NSLog(@"%@",[Per description]);
        NSLog(@"%@",[Hans description]);
        
        NoblePerson *QueenMargrethe = [[NoblePerson alloc] initWithName:@"Queen Margrethe" withSex:@"Female" withAge:@90 withAssets:5000000];
        NoblePerson *PrinceFrederik = [[NoblePerson alloc] initWithName:@"Prince Frederik" withSex:@"Male" withAge:@70 withAssets:20000];
        [QueenMargrethe setButler:Hans];
        NSLog(@"%@",[PrinceFrederik description]);
        NSLog(@"%@",[QueenMargrethe description]);
        NSLog(@"%@",QueenMargrethe.single);
        [QueenMargrethe marry:Per];
        [Per marry:QueenMargrethe];
        
        
    }
    return 0;
}

