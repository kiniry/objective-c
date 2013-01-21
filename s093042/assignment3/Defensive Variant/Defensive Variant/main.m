//
//  main.m
//  Same main.m file for all three variants!
//
//  Created by Sivanujann Selliah on 16/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Citizen.h"
#import "NoblePerson.h"

#define INVARIANTCHECK true

int main(int argc, const char * argv[])
{
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
    @autoreleasepool {
        // The Gellers
        Citizen *aFather = [[Citizen alloc] initWithName:@"Jack Geller" Sex:@"male" Age:50];
        Citizen *aMother = [[Citizen alloc] initWithName:@"Judy Geller" Sex:@"female" Age:50];
        
        [aFather marry:aMother];
        
        // Jack and Judy's kids
        Citizen *aSon = [[Citizen alloc] initWithName:@"Ross Geller" Sex:@"male" Age:30];
        aSon.parents = [NSSet setWithObjects:aFather, aMother, nil];
        
        Citizen *aDaughter = [[Citizen alloc] initWithName:@"Monica Geller" Sex:@"female" Age:28];
        aDaughter.parents = [NSSet setWithObjects:aFather, aMother, nil];
        
        aFather.children = [NSSet setWithObjects:aSon, aDaughter, nil];
        aMother.children = [NSSet setWithObjects:aSon, aDaughter, nil];
        
        // Print the family tree to log
        NSLog(@"%@", aFather);
        NSLog(@"%@", aMother);
        
        // Ross' first wife
        Citizen *aDaughterInLaw = [[Citizen alloc] initWithName:@"Carol Willick" Sex:@"female" Age:30];
        [aSon marry:aDaughterInLaw];
        
        // Print the family tree to log
        NSLog(@"%@", aFather);
        NSLog(@"%@", aMother);
        
        // and their son
        Citizen *aGrandSon = [[Citizen alloc] initWithName:@"Ben Geller-Willick" Sex:@"male" Age:5];
        aGrandSon.parents = [NSSet setWithObjects:aSon, aDaughterInLaw, nil];
        
        aSon.children = [NSSet setWithObjects:aGrandSon, nil];
        aDaughterInLaw.children = [NSSet setWithObjects:aGrandSon, nil];
        
        // Print the family tree to log
        NSLog(@"%@", aFather);
        NSLog(@"%@", aMother);
        
        // Ross and Carol gets divorced
        [aSon divorce];
        
        // Print the family tree to log
        NSLog(@"%@", aFather);
        NSLog(@"%@", aMother);
        
        // Our invariant doesn't hold for aFather and aMother, since we don't know their parents!
        if(INVARIANTCHECK)
            [aFather checkInvariant];
        // So we check the children...
        [aSon checkInvariant];
        [aDaughter checkInvariant];
        
        
        // Some noble people
        NoblePerson *aNoblePerson = [[NoblePerson alloc]initWithName:@"Henry Noble" Sex:@"male" Age:55 Assets:25000000 Butler:aFather];
        NoblePerson *anotherNoblePerson = [[NoblePerson alloc] initWithName:@"Elizabeth Noble" Sex:@"female" Age:56 Assets:25000000 Butler:nil];
        [aNoblePerson marry:anotherNoblePerson];
        
        // their daughter
        NoblePerson *aNobleDaughter = [[NoblePerson alloc] initWithName:@"Kate Noble" Sex:@"female" Age:15 Assets:1000000 Butler:nil];
        aNobleDaughter.parents = [NSSet setWithObjects:aNoblePerson, anotherNoblePerson, nil];
        aNoblePerson.children = [NSSet setWithObjects:aNobleDaughter, nil];
        anotherNoblePerson.children = [NSSet setWithObjects:aNobleDaughter, nil];
        
        // print family tree
        NSLog(@"%@", aNoblePerson);
        NSLog(@"%@", anotherNoblePerson);
        
        // again, the invariant doesn't hold for the parents, because we don't know the parents' parents.
        if(INVARIANTCHECK)
            [aNoblePerson checkInvariant];
        // So we check the child
        [aNobleDaughter checkInvariant];
        
        [anotherNoblePerson divorce];
        // print family tree
        NSLog(@"%@", aNoblePerson);
        NSLog(@"%@", anotherNoblePerson);
        
    }
    //[pool drain];
    
    return 0;
}

