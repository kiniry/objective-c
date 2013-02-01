//
//  PerfMyth&RealCalculateLevenshteinDistance.m
//  Assignment4
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/23/13.
//  Copyright (c) 2013 Bastian Buch, s113432 and Jacob Gjerstrup, s113440. All rights reserved.//

#import "PerfMyth&RealCalculateLevenshteinDistance.h"


@implementation PerfMyth_RealCalculateLevenshteinDistance

// The minimum method compares three objects size and returns the smallest object
- (int)minimum:(int)ObjectA : (int)ObjectB : (int)ObjectC{
    return(((ObjectA < ObjectB) && (ObjectA < ObjectC)) ? ObjectA : ((ObjectB < ObjectA) && (ObjectB < ObjectC)) ? ObjectB : ObjectC);
}

- (int)calculateLevenshteinDistance:(NSString*)stringOne:(NSString*)stringTwo{
// The method for calculating the Levenshtein distance uses two string input parameters and three local variables,
// where two of them is the length of the two strings and the cost of the operations. After these two local variables
// are defined, 2 if statements determine whether either of the string lengths have reached 0 (meaning that the comparisons
// are done and over with) and if this isn't the case, the strings are shortened by one and the strings are then compared
// recursively
    int stringOneLength = stringOne.length;
    int stringTwoLength = stringTwo.length;
    int cost = 0;
    
    if (stringOneLength == 0) return stringTwoLength;
    else if (stringTwoLength == 0) return stringOneLength;
    NSString* newStringOne = [stringOne substringToIndex:(stringOneLength-1)];
    NSString* newStringTwo = [stringTwo substringToIndex:(stringTwoLength-1)];
    
    if ([stringOne characterAtIndex: stringOneLength-1] != [stringTwo characterAtIndex: stringTwoLength-1]) cost=1;
    
    return [self minimum:([self calculateLevenshteinDistance: stringOne : newStringTwo]+1) :([self calculateLevenshteinDistance: newStringOne : stringTwo]+1) :([self calculateLevenshteinDistance: newStringOne : newStringTwo] + cost)];
    }
@end
