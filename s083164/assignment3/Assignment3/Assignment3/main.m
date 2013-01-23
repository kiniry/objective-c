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
        
        //Assertions
        
        Citizen *firstA = [[CitizenAssertion alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        CitizenAssertion *secondA = [[CitizenAssertion alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        // Get married
        [firstA marry:secondA];
        
        // Make a baby
        CitizenAssertion *baby = [[CitizenAssertion alloc] initWithFirstName:@"Robert" lastName:@"Lincoln" sex:male andAge:@50];
        [firstA addChild:baby];
        [secondA addChild:baby];
        
        //Divorce
        [firstA divorce:secondA];
        
        //Logging
        
    }
    return 0;
}

