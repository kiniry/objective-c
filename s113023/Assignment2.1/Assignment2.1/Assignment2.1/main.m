//
//  main.m
//  Assignment2
//
//  Created by Andreas Haure on 10/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // TEST 1.1 - MARRIAGES BETWEEN REGULAR CITIZENS
        Citizen *JustinBieber = [[Citizen alloc] initWithName:@"Justin Bieber" withSex:@"Male" withAge:@15];
        Citizen *NickyMinaj = [[Citizen alloc] initWithName:@"Nicky Minaj" withSex:@"Female" withAge:@30];
        Citizen *OwenWilson = [[Citizen alloc] initWithName:@"Owen Wilsen" withSex:@"Male" withAge:@30];
        Citizen *RebeccaBlack = [[Citizen alloc] initWithName:@"Rebecca Black" withSex:@"Female" withAge:@16];
        [NickyMinaj addChild:JustinBieber];
        [OwenWilson addChild:JustinBieber];
        [RebeccaBlack addChild:JustinBieber];       //Not allowed to add more than one mother
        NSLog(@"%@",[JustinBieber description]);
        NSLog(@"%@",[NickyMinaj description]);
        
        //Not legal marriages
        [JustinBieber marry:NickyMinaj];
        [OwenWilson marry:JustinBieber];
        
        //Legal marriages
        [NickyMinaj marry:OwenWilson];
        [RebeccaBlack marry:JustinBieber];
        NSLog(@"%@",[NickyMinaj description]);
        NSLog(@"%@",[JustinBieber description]);
   
        //Not possible divorces
        [RebeccaBlack divorce:OwenWilson];
        
        //Possible divorce
        [RebeccaBlack divorce:JustinBieber];
        
        //TEST 1.2 - MARRIAGES BETWEEN NOBLE PERSONS
        NoblePerson *MarryDonaldson = [[NoblePerson alloc] initWithName:@"Mary Donaldson" withSex:@"Female" withAge:@40 withAssets:3000];
        NoblePerson *PrinceFrederik = [[NoblePerson alloc] initWithName:@"Prince Frederik" withSex:@"Male" withAge:@40 withAssets:10000];
        NoblePerson *QueenMargrethe = [[NoblePerson alloc] initWithName:@"Queen Margrethe" withSex:@"Female" withAge:@90 withAssets:30];
        NoblePerson *PrinceHenrik = [[NoblePerson alloc] initWithName:@"Prince Henrik" withSex:@"Male" withAge:@80 withAssets:5000000];
        Citizen *ButlerSirMoneyMaker = [[Citizen alloc] initWithName:@"Butler Sir Money Maker" withSex:@"Male" withAge:@30];

        //Not legal marriage - Leads to incest
        [QueenMargrethe addChild:PrinceFrederik];
        [QueenMargrethe marry:PrinceFrederik];
        
        //Not legal marriage - No butler
        [QueenMargrethe marry:PrinceHenrik];
            
        //Legal marriage
        [QueenMargrethe setButler:ButlerSirMoneyMaker];
        [QueenMargrethe marry:PrinceHenrik];
        [MarryDonaldson setButler:ButlerSirMoneyMaker];
        [MarryDonaldson marry:PrinceFrederik];
        
        //Divorce between noble people:
        [MarryDonaldson divorce:PrinceFrederik];
        NSLog(@"%@",MarryDonaldson);
        NSLog(@"%@",QueenMargrethe);
        
    }
    return 0;
}

