//
//  LevenshteinDistance.m
//  Levenshtein
//
//  Created by Emil Klarskov Kristensen on 1/29/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//  Implemented using the source code found on Wikipedia: http://en.wikipedia.org/wiki/Levenshtein_distance#Computing_Levenshtein_distance

#import "LevenshteinDistance.h"

//MIN3 borrowed from the C implementation found here:
//http://en.wikibooks.org/wiki/Algorithm_implementation/Strings/Levenshtein_distance#C

#define MIN3(a,b,c) (a < b ? \
(a < c ? a : c) : \
(b < c ? b : c))

@implementation LevenshteinDistance

-(NSInteger)computeLevenshteinDistanceOf:(NSString *)str1 andString:(NSString*)str2
{
    NSInteger dis = [self compute:str1 withIndex:0 withLength:str1.length andString:str2 withIndex:0 withLength:str2.length];
    return dis;
}

-(NSInteger)compute:(NSString *)str1 withIndex:(NSInteger)index1 withLength:(NSInteger)length1 andString:(NSString*)str2 withIndex:(NSInteger)index2 withLength:(NSInteger)length2
{
    if (!self.memo) self.memo = [[NSMutableDictionary alloc] init];
    
    NSString *key = [NSString stringWithFormat:@"%d,%d,%d,%d",(int)index1, (int)length1, (int)index2, (int)length2];
    NSNumber *obj = [self.memo objectForKey:key];
    
    if (obj) {
        return obj.integerValue;
    }
    
    if(length1 == 0) {
        return length2;
    }
    
    if(length2 == 0) {
        return length1;
    }
    NSInteger cost = 0;
    
    if ([str1 characterAtIndex:index1] != [str2 characterAtIndex:index2]){
        cost = 1;
    }
    
    NSInteger dist = MIN3(([self compute:str1 withIndex:index1+1 withLength:length1-1 andString:str2 withIndex:index2 withLength:length2] + 1),
                          ([self compute:str1 withIndex:index1 withLength:length1 andString:str2 withIndex:index2+1 withLength:length2-1] + 1),
                          ([self compute:str1 withIndex:index1+1 withLength:length1-1 andString:str2 withIndex:index2+1 withLength:length2-1] + cost));
    
    [self.memo setObject:[NSNumber numberWithInteger:dist] forKey:key];
    
    return dist;
    
}

@end
