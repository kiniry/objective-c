//
//  main.m
//  Assignment3-Logging
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
        // ---- TEST CASES: CITIZEN CLASS ----:
        // Persons for test cases:
        Citizen *JohnRambo = [[Citizen alloc] initWithName:@"John Rambo" withSex:@"Male" withAge:@50];
        Citizen *DetectiveJohnKimble = [[Citizen alloc] initWithName:@"Detective John Kimle" withSex:@"Male" withAge:@65];
        Citizen *KateUpton = [[Citizen alloc] initWithName:@"Kate Upton" withSex:@"Female" withAge:@21];
        Citizen *ParisHilton = [[Citizen alloc] initWithName:@"Paris Hilton" withSex:@"Female" withAge:@31];
        Citizen *NeilPatrickHarris = [[Citizen alloc] initWithName:@"Neil Patrick Harris" withSex:@"Male" withAge:@39];
        Citizen *SirEltonJohn = [[Citizen alloc] initWithName:@"Sir Elton John" withSex:@"Male" withAge:@65];
        Citizen *MeganFox = [[Citizen alloc] initWithName:@"Megan Fox" withSex:@"Female" withAge:@26];
        Citizen *JessicaAlba = [[Citizen alloc] initWithName:@"Jessica Alba" withSex:@"Female" withAge:@31];
        
        // Step 1.a: Add children - Legal:
        [JohnRambo addChild:KateUpton];             // OK
        [ParisHilton addChild:KateUpton];           // OK
        
        // Step 1.b: Add children - Illegal:
        [KateUpton addChild:JohnRambo];           // LOG: "You are not allowed to add your own father or mother as your child"
        [KateUpton addChild:ParisHilton];         // LOG: "You are not allowed to add your own father or mother as your child"
        [NeilPatrickHarris addChild:KateUpton];   // LOG: "The child already has a father"
        [MeganFox addChild:KateUpton];            // LOG: "The child already has a mother"
        [JohnRambo addChild:nil];                 // LOG: "You didn't specify a Citizen object to add as child"
        
        // STEP 2.a: Check whether persons can be married - Legal:
        NSLog(@"%@",[JohnRambo canMarry:ParisHilton]?@"YES" : @"NO");           // OK
        NSLog(@"%@",[JohnRambo canMarry:DetectiveJohnKimble]?@"YES" : @"NO");   // OK
        
        // Step 2.b: Check whether persons can be married - Illegal:
        NSLog(@"%@",[JohnRambo canMarry:nil]?@"YES" : @"NO");     //LOG: "You didn't specify a person to check for marriage with"
        
        // Step 3.a: Marriage - Legal:
        [JohnRambo marry:ParisHilton];              // OK
        [KateUpton marry:DetectiveJohnKimble];      // OK
        [JessicaAlba marry:NeilPatrickHarris];      // OK
        
        // Step 3.b: Marriage - Illegal:
        [JohnRambo marry:JohnRambo];              // LOG: "You (John Rambo) are not allowed to marry this person (John Rambo)"
        [JohnRambo marry:KateUpton];              // LOG: "You (John Rambo) are not allowed to marry this person (Kate Upton)"
        [ParisHilton marry:KateUpton];            // LOG: "You (Paris Hilton) are not allowed to marry this person (Kate Upton)
        [KateUpton marry:JohnRambo];              // LOG: "You (Kate Upton) are not allowed to marry this person (John Rambo)"
        [KateUpton marry:ParisHilton];            // LOG: "You (Kate Upton) are not allowed to marry this person (Paris Hilton)"
        [NeilPatrickHarris marry:SirEltonJohn];   // LOG: "You (Neil Patrick Harris) are not allowed to marry this person (Sir Elton John)"
        [MeganFox marry:JessicaAlba];             // LOG: "You (Megan Fox) are not allowed to marry this person (Jessica Alba)"
        [SirEltonJohn marry:nil];                 // LOG: "You (Sir Elton John) didn't specify a person to marry ((null))"
        
        // Step 4.a: Divorce - Legal:
        [JohnRambo divorce:ParisHilton];            // OK
        [KateUpton divorce:DetectiveJohnKimble];    // OK
        
        // Step 4.b Divorce - Illegal
        [JessicaAlba divorce:KateUpton];            // LOG: "You (Jessica Alba) were never married to Kate Upton, and therefore not able to divorce him/her"
        [KateUpton divorce:JohnRambo];              // LOG: "You (Kate Upton) were never married to John Rambo, and therefore not able to divorce him/her"
        [JohnRambo divorce:nil];                    // LOG: "You (John Rambo) were never married to (null), and therefore not able to divorce him/her"        
        
        
        // ---- TEST CASES: CITIZEN CLASS ----:
        // Persons for test cases:
        NoblePerson *QueenMargrethe = [[NoblePerson alloc] initWithName:@"Queen Margrethe" withSex:@"Female" withAge:@80 withAssets:5000000];
        NoblePerson *PrinceFrederik = [[NoblePerson alloc] initWithName:@"Prince Frederik" withSex:@"Male" withAge:@30 withAssets:20000];
        NoblePerson *PrinceJoakim = [[NoblePerson alloc] initWithName:@"Prince Joakim" withSex:@"Male" withAge:@28 withAssets:5];
        NoblePerson *PrincessMary = [[NoblePerson alloc] initWithName:@"Princess Mary" withSex:@"Female" withAge:@40 withAssets:10];
        NoblePerson *PrinceHenrik = [[NoblePerson alloc] initWithName:@"Prince Henrik" withSex:@"Male" withAge:@90 withAssets:100000000000.5];
        NoblePerson *PrincessMarie = [[NoblePerson alloc] initWithName:@"Princess Marie" withSex:@"Female" withAge:@25 withAssets:450000];
        NoblePerson *GrevIngolf = [[NoblePerson alloc] initWithName:@"Grev Ingolf" withSex:@"Male" withAge:@100 withAssets:0];
        
        // Step 1: Add children - Legal
        [QueenMargrethe addChild:PrinceJoakim];         // OK
        [QueenMargrethe addChild:PrinceFrederik];       // OK
        [PrinceHenrik addChild:PrinceJoakim];           // OK
        [PrinceHenrik addChild:PrinceFrederik];         // OK
        
        // Step 2.a: Add Butler - Legal
        [QueenMargrethe setButler:KateUpton];               // OK
        [PrinceFrederik setButler:DetectiveJohnKimble];     // OK
        [PrinceFrederik setButler:JohnRambo];               // OK (to change butler)
        [PrincessMary setButler:JessicaAlba];               // OK
        NSLog(@"%@",PrinceFrederik.butler.name);            // OK
        
        // Step 2.b: Add Butler - Illegal
        [PrinceJoakim setButler:QueenMargrethe];          // LOG: "You (Prince Joakim) can't add a noble butler ((null))"
        [PrinceFrederik setButler:PrinceFrederik];        // LOG: "You (Prince Frederik) can't add a noble butler (John Rambo)"
        [QueenMargrethe setButler:nil];                   // LOG: "You must specify a Citizen object as butler"
        
        // Step 3.a: Marry - Legal
        [QueenMargrethe marry:PrinceHenrik];        // OK
        NSLog(@"%@",[QueenMargrethe description]);  // OK
        NSLog(@"%@",[PrinceHenrik description]);    // OK
        [PrincessMary marry:PrinceFrederik];        // OK
        NSLog(@"%@",[PrincessMary description]);    // OK
        NSLog(@"%@",[PrinceFrederik description]);  // OK
        
    }
    return 0;
}

