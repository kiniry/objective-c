/*************************************************************************
 *  File name   : mem_Test.m
 *  Description : Class for Memory Test
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "mem_Test.h"

#define MINIMUM(a,b,c) MIN(MIN(a,b),c)

@interface mem_Test ()

@end

@implementation mem_Test

+ (int)LevenshteinDistanceBetween:(NSString*)s and:(NSString*)t
{
	int len_s = (int)[s length];
    int len_t = (int)[t length];
    int cost = 0;

	if (len_s == 0) return len_t;
	if (len_t == 0) return len_s;
	if ([s characterAtIndex:0] != [t characterAtIndex:0]) cost = 1;
	return MINIMUM([mem_Test LevenshteinDistanceBetween:[s substringFromIndex:1] and:t] + 1,
					[mem_Test LevenshteinDistanceBetween:s and:[t substringFromIndex:1]] + 1,
					[mem_Test LevenshteinDistanceBetween:[s substringFromIndex:1] and:[t substringFromIndex:1]] + cost);
}

@end
