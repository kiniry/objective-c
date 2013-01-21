//
//  main.m
//  assignment3
//
//  Created by Anders Emil Nielsen on 20/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#undef DEBUG

#import <Foundation/Foundation.h>
#import "CitizenDefensive.h"
#import "CitizenLogging.h"
#import "CitizenAssertion.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // --------------------------------------------------------------------------
        // # Defensive programming
        // --------------------------------------------------------------------------
        CitizenDefensive *citizenDef = [[CitizenDefensive alloc] initWithName: @"Carl" andSex: male andAge:@30];
        CitizenDefensive *sweetiepieDef = [[CitizenDefensive alloc] initWithName: @"Lola" andSex: female andAge:@25];
        [citizenDef marry:sweetiepieDef];
        
        CitizenDefensive *childDef = [[CitizenDefensive alloc] initWithName: @"Fred" andSex: female andAge:@25];
        [childDef setMother:sweetiepieDef andFather:citizenDef];
        
        [citizenDef divorse];

        // To prevent the program from crashing a try/catch-block statement is used
        @try {
            [citizenDef divorse]; // causes an exception
        }
        @catch (NSException *exception) {
            // Production: Alert to exception agent
            // Development: Deal with the exception!
            // [ExceptionNotifier notify:exception]
            NSLog(@"Cannot divorse when sngle");
        }
        
        // --------------------------------------------------------------------------
        // # Logging approach
        // --------------------------------------------------------------------------
        CitizenLogging *citizenLog = [[CitizenLogging alloc] initWithName: @"Carl" andSex: male andAge:@30];
        CitizenLogging *sweetiepieLog = [[CitizenLogging alloc] initWithName: @"Lola" andSex: female andAge:@25];
        [citizenLog marry:sweetiepieLog];
        [citizenLog marry:sweetiepieLog];
        
        CitizenLogging *childLog = [[CitizenLogging alloc] initWithName: @"Fred" andSex: female andAge:@25];
        [childLog setMother:sweetiepieLog andFather:citizenLog];
        
        [citizenLog divorse];
        
        // --------------------------------------------------------------------------
        // # Assertion approach
        // --------------------------------------------------------------------------
        CitizenAssertion *citizenAssert = [[CitizenAssertion alloc] initWithName: @"Carl" andSex: male andAge:@30];
        CitizenAssertion *sweetiepieAssert = [[CitizenAssertion alloc] initWithName: @"Lola" andSex: female andAge:@25];
        [citizenAssert marry:sweetiepieAssert];
        
        CitizenAssertion *childAssert = [[CitizenAssertion alloc] initWithName: @"Fred" andSex: female andAge:@25];
        [childAssert setMother:sweetiepieAssert andFather:citizenAssert];
        
        [citizenAssert divorse];

        // Assertions throws exceptions when fails and can
        // therefore also be catched by a try/catch statement
        @try {
            [citizenDef divorse]; // causes an exception
        }
        @catch (NSException *exception) {
            // Production: Alert to exception agent
            // Development: Deal with the exception!
            // [ExceptionNotifier notify:exception]
            NSLog(@"Cannot divorse when sngle");
        }
    }
    return 0;
}

