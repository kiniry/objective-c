//
//  main.m
//  Assignment3
//
//  Created by Emil Klarskov Kristensen on 1/22/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CitizenAssertion.h"
#import "CitizenLogging.h"
#import "CitizenDefensive.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Assertions
        
        CitizenAssertion *firstAssertionCitizen = [[CitizenAssertion alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        CitizenAssertion *secondAssertionCitizen = [[CitizenAssertion alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        // Get married
        [firstAssertionCitizen marry:secondAssertionCitizen];
        
        // Make a baby
        CitizenAssertion *babyAssertionCitizen = [[CitizenAssertion alloc] initWithFirstName:@"Robert" lastName:@"Lincoln" sex:male andAge:@50];
        [firstAssertionCitizen addChild:babyAssertionCitizen];
        [secondAssertionCitizen addChild:babyAssertionCitizen];
        
        //Divorce
        [firstAssertionCitizen divorce:secondAssertionCitizen];
        
        //Logging
        
        CitizenLogging *firstLoggingCitizen = [[CitizenLogging alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        CitizenLogging *secondLoggingCitizen = [[CitizenLogging alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        // Get married
        [firstLoggingCitizen marry:secondLoggingCitizen];
        
        // Make a baby
        CitizenLogging *babyLoggingCitizen = [[CitizenLogging alloc] initWithFirstName:@"Robert" lastName:@"Lincoln" sex:male andAge:@50];
        [firstLoggingCitizen addChild:babyLoggingCitizen];
        [secondLoggingCitizen addChild:babyLoggingCitizen];
        
        //Divorce
        [firstLoggingCitizen divorce:secondLoggingCitizen];
        
        //Defensive
        
        CitizenDefensive *firstDefensiveCitizen = [[CitizenDefensive alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        CitizenDefensive *secondDefensiveCitizen = [[CitizenDefensive alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        // Get married
        [firstDefensiveCitizen marry:secondDefensiveCitizen];
        
        // Make a baby
        CitizenDefensive *babyDefensiveCitizen = [[CitizenDefensive alloc] initWithFirstName:@"Robert" lastName:@"Lincoln" sex:male andAge:@50];
        [firstDefensiveCitizen addChild:babyDefensiveCitizen];
        [secondDefensiveCitizen addChild:babyDefensiveCitizen];
        
        //Divorce
        [firstDefensiveCitizen divorce:secondDefensiveCitizen];
        
    }
    return 0;
}

