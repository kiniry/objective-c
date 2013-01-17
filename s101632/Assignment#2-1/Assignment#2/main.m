//
//  main.m
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"
#import "FunWithNil.h"
#import "FunWithBlocks.h"
#import "FunWithProtocols.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NoblePerson* tony = [[NoblePerson alloc] initWithFirstName:@"Tony" sex:male age:@45];
        NoblePerson* carmela = [[NoblePerson alloc] initWithFirstName:@"Carmela" sex:female age:@42];
        NoblePerson* meadow = [[NoblePerson alloc] initWithFirstName:@"Meadow" sex:female age:@17];
        Citizen* christopher = [[Citizen alloc] initWithFirstName:@"Christopher" sex:male age:@35];
        Citizen* adriana = [[Citizen alloc] initWithFirstName:@"Adriana" sex:female age:@32];
        tony.assets = @5000;
        carmela.assets = @3000;
        meadow.mother = carmela;
        meadow.father = tony;
        [tony marry:carmela andAssignButler:christopher];
        [tony.Children addObject:meadow];
        [christopher marry:adriana];
        
        // ------------------------- Experimantions from here and down ------------------------- 
        
        //-------------------------  Nil experiment. ------------------------- 
        FunWithNil* nilexp = [[FunWithNil alloc] init];
        [nilexp play];
        
        // ------------------------- Fun with blocks ------------------------- 
        FunWithBlocks* blockExp = [[FunWithBlocks alloc] initWithDouble:3.0];
        //It is possible to manipulate variables in other objects with a variable from the object where the
        // block is defined
        double multiplier = 2.3;
        [blockExp changeNumberWithABlock:^{
            return multiplier;
        }];
        NSLog(@"%f",blockExp.num);
        
        //You can add blocks to the different collections, which is not the case in Java
        
        [blockExp.blocks addObject:^(){
            NSLog(@"You look gooooood!");
        }];
        
        [blockExp.blocks addObject:^(){
            NSLog(@"Very nice!");
        }];
        
        // ------------------------- Fun with protocols -------------------------
        
        /*
         This does not work, and I can't figure out why. I would like some help here!
         */
        FunWithProtocols* protFun = [[FunWithProtocols alloc] init];
        [protFun.delegate doSomething];
        
        
        
        
    }
    return 0;
}

