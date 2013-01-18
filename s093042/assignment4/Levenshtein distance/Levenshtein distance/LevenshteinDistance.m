//
//  LevenshteinDistance.m
//  Levenshtein distance
//
//  Created by Sivanujann Selliah on 18/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "LevenshteinDistance.h"

@implementation LevenshteinDistance

// the number of edits (edits being deletion, insertion and substututing one character) between two strings
// created using the psedocode from http://en.wikipedia.org/wiki/Levenshtein_distance#Computing_Levenshtein_distance
+(int) distanceBetween:(NSString *)s And:(NSString *)t
{
    int len_s = (int)[s length];
    int len_t = (int)[t length];
    int cost = 0;
    
    if([s characterAtIndex:(len_s-1)] != [t characterAtIndex:(len_t-1)])
        cost = 1;
    
    if(len_s == 0)
        return len_t;
    else if(len_t == 0)
        return len_s;
    else {
        return MIN([LevenshteinDistance distanceBetween:[s substringToIndex:(len_s-1)] And:t] + 1,
                   MIN([LevenshteinDistance distanceBetween:s And:[t substringToIndex:(len_t-1)]] + 1,
                       [LevenshteinDistance distanceBetween:[s substringToIndex:(len_s-1)] And:[t substringToIndex:(len_t-1)]] + cost));
    }
}

@end
