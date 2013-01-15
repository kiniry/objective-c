//
//  ExperimentMethodResolution.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "ExperimentMethodResolution.h"

//In Objective-C the method resolution is dynamic. This example shows
// that a string is accidentally
// passed into an add-function.
// Surprisingly however, the program does not crash.
// The result is just 5.

@implementation ExperimentMethodResolution

-(double) add:(NSNumber *)a andB:(NSNumber *)b
{
    return a.doubleValue + b.doubleValue;
}

-(void) run
{
    NSNumber *a = [NSNumber numberWithFloat:5];
    id b = @"This is a string";
    double result = [self add:a andB:b];
    NSLog(@"ExperimentMethodResolution: %f", result);
}

@end
