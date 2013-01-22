//
//  LevenshteinDistance.m
//  Assignment4
//
//  Created by Andreas Haure on 21/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "LevenshteinDistance.h"
#define MIN3(A,B,C) MIN(MIN(A,B),C)

@implementation LevenshteinDistance

+(int)distanceFromString:(NSString *)stringOne toString:(NSString *)stringTwo
{
    int len_stringOne = (int)[stringOne length];
    int len_stringTwo = (int)[stringTwo length];
    int cost = 0;
    
    if ([stringOne characterAtIndex:(len_stringOne-1)] != [stringTwo characterAtIndex:(len_stringTwo-1)]){
        cost = 1;
    }
    
    if (len_stringOne == 0){
        return len_stringTwo;
    } else if (len_stringTwo == 0){
        return len_stringOne;
    } else {
        NSString *substringOne = [stringOne substringToIndex:(len_stringOne-1)];
        int distanceOne = [LevenshteinDistance distanceFromString:substringOne toString:stringTwo]+1;
        NSString *substringtwo = [stringTwo substringToIndex:(len_stringTwo-1)];
        int distanceTwo = [LevenshteinDistance distanceFromString:stringOne toString:substringtwo]+1;
        int distanceThree = [LevenshteinDistance distanceFromString:substringOne toString:substringtwo]+cost;
        return MIN3(distanceOne,distanceTwo,distanceThree);
    }
    
    
    
}

@end
