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
        [KateUpton addChild:JohnRambo];                   // LOG: "Precondition violation: You are not allowed to add your own father or mother as your child"
        [KateUpton addChild:ParisHilton];                 // LOG: "Precondition violation: You are not allowed to add your own father or mother as your child"
        [NeilPatrickHarris addChild:KateUpton];           // LOG: "The child already has a father"
        [MeganFox addChild:KateUpton];                    // LOG: "The child already has a mother"
        [JohnRambo addChild:nil];                         // LOG: "Precondition violation: You must specify a child Citizen object to add"
        
        // Step 2.a: Marriage - Legal:
        [JohnRambo marry:ParisHilton];                      // OK
        [KateUpton marry:DetectiveJohnKimble];              // OK
        [JessicaAlba marry:NeilPatrickHarris];              // OK
        
        // Step 2.b: Marriage - Illegal: (LEADS TO MANY LOGS FOR EACH ILLEGAL MARRIAGE SINCE BOTH canMarry AND marry METHODS WILL LOG WHEN CONSTRAINTS HAVE BEEN VIOLATED - SOME MIGHT BE THE SAME)
        [JohnRambo marry:JohnRambo];                      // LOG: "Postcondition violation: A marriage is only possible if the two persons have opposite sex: John Rambo and John Rambo"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: John Rambo and John Rambo"
                                                          // LOG: "Precondition violation, you (John Rambo) and your sweetheart (John Rambo) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be John Rambo and your sweetheart's spouse should be John Rambo"
        
        [JohnRambo marry:KateUpton];                      // LOG: "Postcondition violation: A marriage is only possible if it leads to no incest: John Rambo and Kate Upton"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: John Rambo and Kate Upton"
                                                          // LOG: "Precondition violation, you (John Rambo) and your sweetheart (Kate Upton) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be Kate Upton and your sweetheart's spouse should be John Rambo"
        
        [ParisHilton marry:KateUpton];                    // LOG: "Postcondition violation: A marriage is only possible if it leads to no incest: Paris Hilton and Kate Upton"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons have opposite sex: Paris Hilton and Kate Upton"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Paris Hilton and Kate Upton"
                                                          // LOG: "Precondition violation, you (Paris Hilton) and your sweetheart (Kate Upton) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be Kate Upton and your sweetheart's spouse should be Paris Hilton"
        
        
        [KateUpton marry:JohnRambo];                      // LOG: "Postcondition violation: A marriage is only possible if it leads to no incest: Kate Upton and John Rambo"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Kate Upton and John Rambo"
                                                          // LOG: "Precondition violation, you (Kate Upton) and your sweetheart (John Rambo) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be John Rambo and your sweetheart's spouse should be Kate Upton"
        
        [KateUpton marry:ParisHilton];                    // LOG: "Postcondition violation: A marriage is only possible if it leads to no incest: Kate Upton and Paris Hilton"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons have opposite sex: Kate Upton and Paris Hilton"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Kate Upton and Paris Hilton"
                                                          // LOG: "Precondition violation, you (Kate Upton) and your sweetheart (Paris Hilton) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be Paris Hilton and your sweetheart's spouse should be Kate Upton"
        
        [NeilPatrickHarris marry:SirEltonJohn];           // LOG: "Postcondition violation: A marriage is only possible if the two persons have opposite sex: Neil Patrick Harris and Sir Elton John"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Neil Patrick Harris and Sir Elton John"
                                                          // LOG: "Precondition violation, you (Neil Patrick Harris) and your sweetheart (Sir Elton John) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be Sir Elton John and your sweetheart's spouse should be Neil Patrick Harris"
        
        
        [MeganFox marry:JessicaAlba];                     // LOG: "Postcondition violation: A marriage is only possible if the two persons have opposite sex: Megan Fox and Jessica Alba"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Megan Fox and Jessica Alba"
                                                          // LOG: "Precondition violation, you (Megan Fox) and your sweetheart (Jessica Alba) are not allowed to marry each other"
                                                          // LOG: "Postcondition violation: Your spouse should be Jessica Alba and your sweetheart's spouse should be Megan Fox"
        
        [SirEltonJohn marry:nil];                         // LOG: "Precondition violation: You didn't specify a person to marry"
        
        // Step 3.a: Divorce - Legal:
        [JohnRambo divorce:ParisHilton];                    // OK
        [KateUpton divorce:DetectiveJohnKimble];            // OK
        
        // Step 3.b Divorce - Illegal
        [JessicaAlba divorce:KateUpton];                  // LOG: "Precondition violation: You were never married to this person and therefore not able to divorce him/her"
                                                          // LOG: "Postcondition violation: You (Jessica Alba) and your old spouse (Neil Patrick Harris) should both be single after the divorce"
        [KateUpton divorce:JohnRambo];                    // LOG: "Precondition violation: You were never married to this person and therefore not able to divorce him/her"
        [JohnRambo divorce:nil];                          // LOG: "Precondition violation: You were never married to this person and therefore not able to divorce him/her"
                                                          // LOG: "Postcondition violation: You (John Rambo) and your old spouse ((null)) should both be single after the divorce"
        
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
        
        // Step 2.b: Add Butler - Illegal
        [PrinceJoakim setButler:QueenMargrethe];          // LOG: "Precondition violation: You can't add a noble butler"
                                                          // LOG: "Postcondition violation: The butler wasn't set correctly"
        [PrinceFrederik setButler:PrinceFrederik];        // LOG: "Precondition violation: You can't add a noble butler"
                                                          // LOG: "Postcondition violation: The butler wasn't set correctly"
        [QueenMargrethe setButler:nil];                   // LOG: "Precondition violation: You didn't specify a Citizen as butler"
                                                          // LOG: "Postcondition violation: The butler wasn't set correctly"
        
        // Step 3.a: Marriage - Legal
        [QueenMargrethe marry:PrinceHenrik];                // OK
        [PrinceFrederik marry:PrincessMary];                // OK
        
        // Step 3.b: Marrige - Illegal
        [PrinceJoakim marry:JessicaAlba];                 // LOG: "Precondition violation: Your spouse is not a noble person"
    
        [PrinceJoakim marry:PrinceFrederik];              // LOG: "Postcondition violation: A marriage is only possible if the two persons have opposite sex: Prince Joakim and Prince Frederik"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Prince Joakim and Prince Frederik"
                                                          // LOG: "Not a legal marriage - leads to incest or homosexuality or polygyni"
        [PrinceJoakim marry:QueenMargrethe];              // LOG: "Postcondition violation: A marriage is only possible if it leads to no incest: Prince Joakim and Queen Margrethe"
                                                          // LOG: "Postcondition violation: A marriage is only possible if the two persons are single: Prince Joakim and Queen Margrethe"
                                                          // LOG: "Not a legal marriage - leads to incest or homosexuality or polygyni"
        [PrinceJoakim marry:PrincessMarie];               // LOG: "No butler - No Marriage!"
        
        // Step 4.a Divorce - Legal
        [QueenMargrethe divorce:PrinceHenrik];              // OK
        
        // Step 4.b Divorce - Illegal
        [PrinceFrederik divorce:QueenMargrethe];          // LOG: "Precondition violation: You were never married to this person and therefore not able to divorce him/her"
                                                          // LOG: "Postcondition violation: You (Prince Frederik) and your old spouse (Princess Mary) should both be single after the divorce"
        [PrinceHenrik divorce:QueenMargrethe];            // LOG: "Precondition violation: You were never married to this person and therefore not able to divorce him/her"
        
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

