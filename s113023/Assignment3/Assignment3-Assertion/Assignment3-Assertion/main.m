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
        
        //-----------------------------------------------\\
        //     TEST CASES ASSERTION PROGRAMMING STLE     \\
        //-----------------------------------------------------------------------------------------------------------------------------------------------------//
        
        //--------------------------\\
        //       Citizen Class      \\
        //-----------------------------------------------------------------------------------------------------------------------------------------------------//
        
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
        [JohnRambo addChild:KateUpton];                     // OK
        [ParisHilton addChild:KateUpton];                   // OK
        
        // Step 1.b: Add children - Illegal:
        //[KateUpton addChild:JohnRambo];                   // EXCEPTION: "recondition violation: You are not allowed to add your own father or mother as your child"
        //[KateUpton addChild:ParisHilton];                 // EXCEPTION: "Precondition violation: You are not allowed to add your own father or mother as your child"
        //[NeilPatrickHarris addChild:KateUpton];           // LOG: "The child already has a father"
        //[MeganFox addChild:KateUpton];                    // LOG: "The child already has a mother"
        //[JohnRambo addChild:nil];                         // EXCEPTION: "Precondition violation: You must specify a child Citizen object to add"
        
        // Step 2.a: Marriage - Legal:
        [JohnRambo marry:ParisHilton];                      // OK
        [KateUpton marry:DetectiveJohnKimble];              // OK
        [JessicaAlba marry:NeilPatrickHarris];              // OK
        
        // Step 2.b: Marriage - Illegal:
        //[JohnRambo marry:JohnRambo];                      // EXCEPTION: "Postcondition violation: A marriage is only possible if the two persons have opposite sex"
        //[JohnRambo marry:KateUpton];                      // EXCEPTION: "Postcondition violation: A marriage is only possible if it leads to no incest"
        //[ParisHilton marry:KateUpton];                    // EXCEPTION: "Postcondition violation: A marriage is only possible if it leads to no incest"
        //[KateUpton marry:JohnRambo];                      // EXCEPTION: "Postcondition violation: A marriage is only possible if it leads to no incest"
        //[KateUpton marry:ParisHilton];                    // EXCEPTION: "Postcondition violation: A marriage is only possible if it leads to no incest"
        //[NeilPatrickHarris marry:SirEltonJohn];           // EXCEPTION: "Postcondition violation: A marriage is only possible if the two persons have opposite sex"
        //[MeganFox marry:JessicaAlba];                     // EXCEPTION: "Postcondition violation: A marriage is only possible if the two persons have opposite sex"
        //[SirEltonJohn marry:nil];                         // EXCEPTION: "Precondition violation, you didn't specify a Citizen object to marry"
        
        // Step 3.a: Divorce - Legal:
        [JohnRambo divorce:ParisHilton];                    // OK
        [KateUpton divorce:DetectiveJohnKimble];            // OK
        
        // Step 3.b Divorce - Illegal
        //[JessicaAlba divorce:KateUpton];                  // EXCEPTION: "You were never married to this person and therefore not able to divorce him/her"
        //[KateUpton divorce:JohnRambo];                    // EXCEPTION: "Precondition violation: You are single and therefore not able to divorce anyone"
        //[JohnRambo divorce:nil];                          // EXCEPTION: "Precondition violation: You are single and therefore not able to divorce anyone"
        
        // Descriptions of Testpersons:
        
        NSLog(@"%@",JohnRambo);
        NSLog(@"%@",DetectiveJohnKimble);
        NSLog(@"%@",KateUpton);
        NSLog(@"%@",ParisHilton);
        NSLog(@"%@",NeilPatrickHarris);
        NSLog(@"%@",SirEltonJohn);
        NSLog(@"%@",MeganFox);
        NSLog(@"%@",JessicaAlba);
        
        //--------------------------\\
        //     NoblePerson Class    \\
        //-----------------------------------------------------------------------------------------------------------------------------------------------------//
        
        // Persons for test cases:
        NoblePerson *QueenMargrethe = [[NoblePerson alloc] initWithName:@"Queen Margrethe" withSex:@"Female" withAge:@80 withAssets:50000];
        NoblePerson *PrinceFrederik = [[NoblePerson alloc] initWithName:@"Prince Frederik" withSex:@"Male" withAge:@30 withAssets:20000];
        NoblePerson *PrinceJoakim = [[NoblePerson alloc] initWithName:@"Prince Joakim" withSex:@"Male" withAge:@28 withAssets:40000];
        NoblePerson *PrincessMary = [[NoblePerson alloc] initWithName:@"Princess Mary" withSex:@"Female" withAge:@40 withAssets:30000];
        NoblePerson *PrinceHenrik = [[NoblePerson alloc] initWithName:@"Prince Henrik" withSex:@"Male" withAge:@90 withAssets:90000];
        NoblePerson *PrincessMarie = [[NoblePerson alloc] initWithName:@"Princess Marie" withSex:@"Female" withAge:@25 withAssets:100000];
        NoblePerson *GrevIngolf = [[NoblePerson alloc] initWithName:@"Grev Ingolf" withSex:@"Male" withAge:@100 withAssets:80000];
        
        // Step 1: Add children - Legal
        [QueenMargrethe addChild:PrinceJoakim];             // OK
        [QueenMargrethe addChild:PrinceFrederik];           // OK
        [PrinceHenrik addChild:PrinceJoakim];               // OK
        [PrinceHenrik addChild:PrinceFrederik];             // OK
        
        // Step 2.a: Add Butler - Legal
        [QueenMargrethe setButler:KateUpton];               // OK
        [PrinceFrederik setButler:DetectiveJohnKimble];     // OK
        [PrinceFrederik setButler:JohnRambo];               // OK (to change butler)
        [PrincessMary setButler:JessicaAlba];               // OK
        NSLog(@"%@",PrinceFrederik.butler.name);            // OK
        
        // Step 2.b: Add Butler - Illegal
        //[PrinceJoakim setButler:QueenMargrethe];          // EXCEPTION: "Precondition violation: You can't add a noble butler"
        //[PrinceFrederik setButler:PrinceFrederik];        // EXCEPTION: "Precondition violation: You can't add a noble butler"
        //[QueenMargrethe setButler:nil];                   // EXCEPTION: "Precondition violatin: You didn't specify a Citizen as butler"
        
        // Step 3.a: Marriage - Legal
        [QueenMargrethe marry:PrinceHenrik];                // OK
        [PrinceFrederik marry:PrincessMary];                // OK
        
        // Step 3.b: Marrige - Illegal
        //[PrinceJoakim marry:JessicaAlba];                 // EXCEPTION: "Precondition violation: Your spouse is not a noble person"
        //[PrinceJoakim marry:PrinceFrederik];              // EXCEPTION: "Postcondition violation: A marriage is only possible if the two persons have opposite sex"
        //[PrinceJoakim marry:QueenMargrethe];              // EXCEPTION: "Postcondition violation: A marriage is only possible if it leads to no incest"
        //[PrinceJoakim marry:PrincessMarie];               // EXCEPTION: "No butler - No Marriage!"
        
        // Step 4.a Divorce - Legal
        [QueenMargrethe divorce:PrinceHenrik];              // OK
        
        // Step 4.b Divorce - Illegal
        //[PrinceFrederik divorce:QueenMargrethe];          // EXCEPTION: "Precondition violation: You were never married to this person and therefore not able to divorce him/her"
        //[PrinceHenrik divorce:QueenMargrethe];            // EXCEPTION: "Precondition violation: You are single and therefore not able to divorce anyone"
        
        // Descriptions of Testpersons:
        
        NSLog(@"%@",QueenMargrethe);
        NSLog(@"%@",PrinceFrederik);
        NSLog(@"%@",PrinceJoakim);
        NSLog(@"%@",PrincessMary);
        NSLog(@"%@",PrinceHenrik);
        NSLog(@"%@",PrincessMarie);
        NSLog(@"%@",GrevIngolf);
        
        //-----------------------------------------------------------------------------------------------------------------------------------------------------//
        
    }
    return 0;
}

