//
//  main.m
//  Assignment2-PartTwo
//
//  Created by Markus Færevaag on 15.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Test *foo = [[Test alloc] init];
        [foo printArrayEntries:nil];
        
    }
    return 0;
}

