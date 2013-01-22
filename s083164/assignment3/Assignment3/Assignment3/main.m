//
//  main.m
//  Assignment3
//
//  Created by Emil Klarskov Kristensen on 1/22/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CitizenAssertion.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *firstCitizen = [[CitizenAssertion alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        CitizenAssertion *secondCitizen = [[CitizenAssertion alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        // Get married
        [firstCitizen marry:secondCitizen];
        NSLog(@"%@ is married to %@", firstCitizen.firstName, firstCitizen.spouse.firstName);
        
        // Make a baby
        CitizenAssertion *baby = [[CitizenAssertion alloc] initWithFirstName:@"Robert" lastName:@"Lincoln" sex:male andAge:@50];
        [firstCitizen addChild:baby];
        [secondCitizen addChild:baby];
        
    }
    return 0;
}

