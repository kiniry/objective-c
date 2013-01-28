//
//  NSMutableString+RegularExpression.m
//  Assignment5
//
//  Created by Andreas Graulund on 26/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "NSMutableString+RegularExpression.h"

@implementation NSMutableString (RegularExpression)

-(NSUInteger)replaceOccurrencesOfMatch:(NSString *)match withString:(NSString *)replacement {
	
	NSError *error; // Error handling doesn't go very well here.
	
	// Create the regex
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:match options:NSRegularExpressionCaseInsensitive error:&error];
	
	// Search/replace!
	return [regex replaceMatchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, [self length]) withTemplate:replacement];
}

@end
