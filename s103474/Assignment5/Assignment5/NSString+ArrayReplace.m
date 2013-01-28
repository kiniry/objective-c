//
//  NSString+ArrayReplace.m
//  Assignment5
//
//  Created by Andreas Graulund on 25/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "NSString+ArrayReplace.h"

@implementation NSString (ArrayReplace)

-(NSString *)stringByReplacingOccurrencesOfStrings:(NSArray *)searches withStrings:(NSArray *)replaces {
	NSMutableString *s = [self mutableCopy];
	// Using old style enumeration because I need the value of i
	for (int i = 0; i < [searches count]; i++) {
		[s replaceOccurrencesOfString:searches[i] withString:replaces[i] options:NSCaseInsensitiveSearch range:NSMakeRange(0, [self length])];
	}
	return [s copy];
}

-(NSString *)stringByReplacingOccurrencesOfStrings:(NSArray *)searches withString:(NSString *)replace {
	NSMutableString *s = [self mutableCopy];
	for (int i = 0; i < [searches count]; i++) {
		[s replaceOccurrencesOfString:searches[i] withString:replace options:NSCaseInsensitiveSearch range:NSMakeRange(0, [self length])];
	}
	return [s copy];
}

@end
