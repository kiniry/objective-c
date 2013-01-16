//
//  Test.m
//  Assignment2-PartTwo
//
//  Created by Markus Færevaag on 15.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Test.h"

@implementation Test

@synthesize title = _title;

-(void) printArrayEntries:(NSArray *)array
{
    NSLog(@"Printing array: %@", array);
    int i;
    for(i = 0; i < [array count]; ++i)
    {
        NSLog(@"%d: %@", i, [[array objectAtIndex:i] stringValue]);
    }
    NSLog(@"%@", [[array objectAtIndex:0] stringValue]);
}

@end
