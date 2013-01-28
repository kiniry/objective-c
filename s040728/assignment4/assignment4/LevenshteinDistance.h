//
//  LevenshteinDistance.h
//  assignment4
//
//  Created by Magloire on 1/28/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevenshteinDistance : NSObject
+(int)distanceBetween:(NSString *)s1 and:(NSString *)s2;
+(long) distanceUsingRecursionBetween:(NSString *)s1 and:(NSString *)s2;
@end

/*

 if(s.length() == 0) return t.length();
 if(t.length() == 0) return s.length();
 
 
if(s.charAt(0) == t.charAt(0))
return levenshtein(s.substring(1), t.substring(1));


int a = levenshtein(s.substring(1), t.substring(1));
int b = levenshtein(s, t.substring(1));
int c = levenshtein(s.substring(1), t);

if(a > b) a = b;
if(a > c) a = c;

//any of which is 1 edit plus editing the rest of the strings
return a + 1;

*/