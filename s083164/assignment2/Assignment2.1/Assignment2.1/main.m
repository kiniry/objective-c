//
//  main.m
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *firstCitizen = [[Citizen alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        Citizen *secondCitizen = [[Citizen alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        // Get married
        [firstCitizen marry:secondCitizen];
        NSLog(@"%@ is married to %@", firstCitizen.firstName, firstCitizen.spouse.firstName);
        
        // Make a baby
        Citizen *baby = [[Citizen alloc] initWithFirstName:@"Robert" lastName:@"Lincoln" sex:male andAge:@50];
        [firstCitizen addChild:baby];
        [secondCitizen addChild:baby];
        
        NSLog(@"%@ is the father of: %@", [firstCitizen fullName], [firstCitizen children]);
        
        NoblePerson *firstNoblePerson = [[NoblePerson alloc] initWithFirstName:@"Prince" lastName:@"William" sex:male andAge:@29];
        NoblePerson *secondNoblePerson = [[NoblePerson alloc] initWithFirstName:@"Kate" lastName:@"Middleton" sex:male andAge:@28];
        
        Citizen *firstButler = [[Citizen alloc] initWithFirstName:@"Alfred" lastName:@"Pennyworth" sex:female andAge:@65];
        
        firstNoblePerson.numberOfAssets = 1000000;
        secondNoblePerson.numberOfAssets = 30000;
        
        firstNoblePerson.butler = firstButler;
        
        [firstNoblePerson marry:secondNoblePerson];
        
    }
    return 0;
}

