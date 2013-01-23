//
//  main.m
//  assignment3-assertions
//
//  Created by Jonas Eriksen on 22/01/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "Nobel.h"

int main(int argc, const char * argv[])
{

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // make a two citizens
    Citizen *svend = [[Citizen alloc] initWithName:@"Svend Erik Larsen" withSex:male withAge:73];
    
    Citizen *lise = [[Citizen alloc] initWithName:@"Lise Larsen" withSex:female withAge:71];
    
    // let them marry
    [svend marryCitizen:lise];
    NSCAssert(lise.spouse == svend, @"Svend and Lise was not married");
    
    // add a citizen (child)
    Citizen *athur = [[Citizen alloc] initWithName:@"Alfred Pennyworth" withSex:male withAge:48];
    
    // add father to child
    athur.father = svend;
    NSCAssert([svend.children member:athur], @"Athur was not added as a child of Svend");
    // add child to mother
    [lise parentToCitizen:athur];
    NSCAssert([athur.parents member:lise], @"Lise was not added as mother to Svend");
    
    // create a Nobel Person
    Nobel *sir = [[Nobel alloc] initWithName:@"Sir Richard Branson" withSex:male withAge:62 withAssets:2000000];
    // assign a butler
    sir.butler = athur;
    
    // add another Nobel
    Nobel *lady = [[Nobel alloc] initWithName:@"Lady Mary Tudor" withSex:female withAge:459 withAssets:10000];
    
    // let them marry
    [sir marryCitizen:lady];
    NSCAssert(lady.spouse == sir, @"Sir and Lady was not married");
    NSCAssert(lady.assets == sir.assets, @"Assets is not correctly shared between newly married");
    
    // let them divorce
    [sir divorce];
    NSCAssert((lady.spouse == nil) && (sir.spouse == nil) , @"Sir and Lady was not propperly divorsed");
    NSCAssert(sir.single && lady.single, @"Sir and Lady was not propperly divorsed");
    
    
    [pool drain];
    return 0;
}

