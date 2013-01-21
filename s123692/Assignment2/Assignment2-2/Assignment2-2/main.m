//
//  main.m
//  Assignment2-PartTwo
//
//  Created by Markus Færevaag on 15.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NilTest.h"
#import "ExTest.h"
#import "BlockTest.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"============= Boxing =============");
        NSNumber *boxedInt = @42; // boxed
        NSLog(@"Unboxing NSNumber to int: %d", [boxedInt intValue]); // unboxed
        
        
        NSLog(@"============ Exception ===========");
        [ExTest throwExceptionWithName:@"Trololo" andMsg:@"Bare fordi..."];
        
        
        NSLog(@"============= Blocks =============");
        BlockTest *blox = [[BlockTest alloc] init];
        [blox runSomeBlockWithMsg:@"Bloxxxing"];
        
        
        NSLog(@"========= Nil Reference ==========");
        // Shows that referencing nil values only returns (null),
        // without any exception being trown.
        [NilTest printArrayEntries:nil];
        // Calling nil-method:
        @try {
            NSLog(@"Calling nil-method: %@", [NilTest thisIsANilMethod]);
        }
        @catch (NSException *e) {
            NSLog(@"Exception: \n> Name: %@ \n> Reason: %@", e.name, e.reason);
        }
        @finally {
            NSLog(@"============= FINISH =============");
        }
        
        
    }
    return 0;
}

