//
//  LevenshteinDistance.m
//  assignment4
//
//  Created by Magloire on 1/28/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "LevenshteinDistance.h"

@implementation LevenshteinDistance
+(int) distanceBetween:(NSString *)s1 and:(NSString *)s2{
    NSString *_s1 = [s1 lowercaseString];
    NSString *_s2 = [s2 lowercaseString];
    
    NSMutableArray *costs = [NSMutableArray array];
    for (int i=0; i <= [_s1 length]; i++) {
        int lastValue = 1;
        for (int j=0; j <= s2.length; j++) {
            if(i == 0){
                [costs insertObject:[NSNumber numberWithInt:j] atIndex:j];
            }else{
                if(j > 0){
                    int newValue = [[costs objectAtIndex:j-1] intValue];
                    if ([_s1 characterAtIndex:i-1] != [_s2 characterAtIndex:j-1]) {
                       // int _min = MIN(newValue, lastValue);
                       // int _cost = [[costs objectAtIndex:j] intValue];
                        newValue = MIN(MIN(newValue, lastValue), [[costs objectAtIndex:j] intValue]) + 1;
                        [costs insertObject:[NSNumber numberWithInt:lastValue] atIndex:j-1];
                        lastValue = newValue;
                    }
                }
            }
            if (i > 0) {
                [costs insertObject:[NSNumber numberWithInt:lastValue] atIndex:_s2.length];
            }
        }
    }
    
    return [[costs objectAtIndex:_s2.length] intValue];
}

+(long) distanceUsingRecursionBetween:(NSString *)s1 and:(NSString *)s2{
    if (s1.length == 0) return s2.length;
    if (s2.length == 0) return s1.length;
    
    if([s1 characterAtIndex:0] == [s2 characterAtIndex:0])
        return [self distanceUsingRecursionBetween:[s1 substringFromIndex:1] and:[s2 substringFromIndex:1]];
    
    long a = [self distanceUsingRecursionBetween:[s1 substringFromIndex:1] and:[s2 substringFromIndex:1]];
    
    long b = [self distanceUsingRecursionBetween:s1 and:[s2 substringFromIndex:1]];
    
    long c = [self distanceUsingRecursionBetween:[s1 substringFromIndex:1] and:s2];
    
    if(a > b) a = b;
    if(a > c) a = c;
    
    return a + 1;
}
@end

/*


 int[] costs = new int[s2.length() + 1];
 for (int i = 0; i <= s1.length(); i++) {
 int lastValue = i;
 for (int j = 0; j <= s2.length(); j++) {
 if (i == 0)
 costs[j] = j;
 else {
 if (j > 0) {
 int newValue = costs[j - 1];
 if (s1.charAt(i - 1) != s2.charAt(j - 1))
 newValue = Math.min(Math.min(newValue, lastValue), costs[j]) + 1;
 costs[j - 1] = lastValue;
 lastValue = newValue;
 }
 }
 }
 if (i > 0)
 costs[s2.length()] = lastValue;
 }
 return costs[s2.length()];
*/