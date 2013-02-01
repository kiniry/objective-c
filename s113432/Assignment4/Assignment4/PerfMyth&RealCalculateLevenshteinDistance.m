//
//  PerfMyth&RealCalculateLevenshteinDistance.m
//  Assignment4
//
//  Created by Bastian Buch on 1/23/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "PerfMyth&RealCalculateLevenshteinDistance.h"


@implementation PerfMyth_RealCalculateLevenshteinDistance
- (int)minimum:(int)ObjectA : (int)ObjectB : (int)ObjectC{
    return(((ObjectA < ObjectB) && (ObjectA < ObjectC)) ? ObjectA : ((ObjectB < ObjectA) && (ObjectB < ObjectC)) ? ObjectB : ObjectC);
}

- (int)calculateLevenshteinDistance:(NSString*)stringOne:(NSString*)stringTwo{
    //TODO: Fix crash on out of bounds on smallest string, rearrange if statements
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
