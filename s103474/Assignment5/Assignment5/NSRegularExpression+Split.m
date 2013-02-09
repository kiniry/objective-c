//
//  NSRegularExpression+Split.m
//  Assignment5
//
//  Created by Andreas Graulund on 26/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "NSRegularExpression+Split.h"

@implementation NSRegularExpression (Split)

-(NSArray *)splitByMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range {
	
	NSMutableString *s = [string mutableCopy];
	
	// Gathering all the matching separators
	NSArray *separators = [self matchesInString:string options:options range:range];
	
	// Using a marker like this is probably not the best practice.
	// Could easily be actually written in the text we're trying to split.
	NSString *splitMarker = @"%%%%%%SPLIT%%%%%%";
	
	// Replace matches with interim marker
	[self replaceMatchesInString:s options:options range:range withTemplate:splitMarker];
	
	// Split by marker into compartments
	NSArray *compartments = [s componentsSeparatedByString:splitMarker];
	
	if ([compartments count] > 0 && [separators count] > 0) {
		// Merge separators and compartments
		NSMutableArray *combination = [compartments mutableCopy];
		
		int i = 1;
		for (NSTextCheckingResult *sep in separators) {
			[combination insertObject:[string substringWithRange:[sep range]] atIndex:i];
			i += 2;
		}
		return [combination copy];
	}
	return compartments;
}

@end
