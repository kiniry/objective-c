//
//  StringManipulation.m
//  Assignment4
//
//  Created by Philip Nielsen on 21/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "StringManipulation.h"

@implementation StringManipulation

+ (int)distanceBetween:(NSString *)s And:(NSString *)t
{
    int sLength = (int)s.length;
    int tLength = (int)t.length;
    int cost = 0;
    
    if ([s characterAtIndex:(sLength-1)] != [t characterAtIndex:(tLength-1)])
        cost = 1;
    
    if (sLength == 0)       return tLength;
    else if (tLength == 0)  return sLength;
    else {
        return MIN([StringManipulation distanceBetween:[s substringToIndex:(sLength-1)] And:t] + 1,
                   MIN([StringManipulation distanceBetween:s And:[t substringToIndex:(tLength-1)]] + 1,
                       [StringManipulation distanceBetween:[s substringToIndex:(sLength-1)] And:[t substringToIndex:(tLength-1)]] + cost));
    }
}

@end
