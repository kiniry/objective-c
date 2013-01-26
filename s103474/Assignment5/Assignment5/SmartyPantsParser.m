//
//  SmartyPantsParser.m
//  Assignment5
//
//  Created by Andreas Graulund on 25/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "SmartyPantsParser.h"
#import "NSString+ArrayReplace.h"
#import "NSString+LastCharacter.h"
#import "NSRegularExpression+Split.h"
#import "NSMutableString+RegularExpression.h"

#define SMARTYPANTS_TAGS_TO_SKIP @"pre|code|kbd|script|style|math"

typedef enum {
	SmartyPantsAttributeOn = 1,
	SmartyPantsAttributeAlternative = 2,
	SmartyPantsAttributeInverted = 3
} SmartyPantsAttribute;

@interface SmartyPantsParser ()

// Options to specify which transformations to make:
@property SmartyPantsAttribute doQuotes;
@property SmartyPantsAttribute doBackticks;
@property SmartyPantsAttribute doDashes;
@property SmartyPantsAttribute doEllipses;
@property SmartyPantsAttribute doStupefy;
@property SmartyPantsAttribute convertQuot;

@end

@implementation SmartyPantsParser

@synthesize doQuotes, doBackticks, doDashes, doEllipses, doStupefy, convertQuot;

-(id)init {
	return [self initWithAttributes:1]; // Default choice
}

-(id)initWithOldSchoolDashShortcuts {
	return [self initWithAttributes:2];
}

-(id)initWithInvertedOldSchoolDashShortcuts {
	return [self initWithAttributes:3];
}

-(id)initWithAttributes:(int)attr {
	self = [super init];
	if (self) {
		[self setAttributes:attr];
	}
	return self;
}

-(id)initWithAttributeString:(NSString *)attrString {
	self = [super init];
	if (self) {
		[self setAttributeString:attrString];
	}
	return self;
}

-(void)setAttributes:(int)attr {
	if (attr == 1) {
		self.doQuotes    = SmartyPantsAttributeOn;
		self.doBackticks = SmartyPantsAttributeOn;
		self.doDashes    = SmartyPantsAttributeOn;
		self.doEllipses  = SmartyPantsAttributeOn;
	} else if (attr == 2){
		self.doQuotes    = SmartyPantsAttributeOn;
		self.doBackticks = SmartyPantsAttributeOn;
		self.doDashes    = SmartyPantsAttributeAlternative;
		self.doEllipses  = SmartyPantsAttributeOn;
	} else if (attr == 3){
		self.doQuotes    = SmartyPantsAttributeOn;
		self.doBackticks = SmartyPantsAttributeOn;
		self.doDashes    = SmartyPantsAttributeInverted;
		self.doEllipses  = SmartyPantsAttributeOn;
	} else if (attr == -1){
		self.doStupefy   = SmartyPantsAttributeOn;
	}
}

-(void)setAttributeString:(NSString *)attrString {
	// If you give a string of numerals, let's redirect
	int attr = [attrString intValue];
	if (attr != 0) {
		return [self setAttributes:attr];
	}
	// Not a number? Go ahead.
	// Enumerate over each character in the NSString, as a one-character NSString.
	[attrString
		enumerateSubstringsInRange:NSMakeRange(0, [attrString length])
		options:NSStringEnumerationByComposedCharacterSequences
		usingBlock:^(NSString *c, NSRange sr, NSRange er, BOOL *stop){
			if ([c isEqualToString:@"q"]) {
				self.doQuotes    = SmartyPantsAttributeOn;
			} else if ([c isEqualToString:@"b"]) {
				self.doBackticks = SmartyPantsAttributeOn;
			} else if ([c isEqualToString:@"B"]) {
				self.doBackticks = SmartyPantsAttributeAlternative;
			} else if ([c isEqualToString:@"d"]) {
				self.doDashes    = SmartyPantsAttributeOn;
			} else if ([c isEqualToString:@"D"]) {
				self.doDashes    = SmartyPantsAttributeAlternative;
			} else if ([c isEqualToString:@"i"]) {
				self.doDashes    = SmartyPantsAttributeInverted;
			} else if ([c isEqualToString:@"e"]) {
				self.doEllipses  = SmartyPantsAttributeOn;
			} else if ([c isEqualToString:@"w"]) {
				self.convertQuot = SmartyPantsAttributeOn;
			}
		}
	];
}

// Are we doing something at all?
-(BOOL) doSomething {
	return (self.doQuotes || self.doBackticks || self.doDashes || self.doEllipses || self.doStupefy);
}

// Convenience method to create a regular expression object without all the bullshit.
-(NSRegularExpression *)getRE:(NSString *)match {
	NSError *error;
	// (Of course, error handling doesn't go very well here.)
	return [NSRegularExpression regularExpressionWithPattern:match options:NSRegularExpressionCaseInsensitive error:&error];
}

// Split HTML string into sections; tags and text.
-(NSArray *)tokenizeHTMLString:(NSString *)input {
	// Variables needed
	NSInteger index = 0;
	NSMutableArray *tokens = [NSMutableArray array];
	
	// Our regex for HTML/XML tags
	NSString *match = @"(?s:<!--.*?-->)|<\\?.*\\?>|(?:<[/!$]?[-a-zA-Z0-9:]+\\b(?>[^\"'>]+|\"[^\"]*\"|'[^']*')*>)";
	
	// Our RegEx element
	NSRegularExpression *regex = [self getRE:match];
	
	// Split the string, separate the elements!
	NSArray *parts = [regex splitByMatchesInString:input options:NSMatchingReportCompletion range:NSMakeRange(0, [input length])];
	
	// Tokenize!
	for (NSString *part in parts) {
		if (++index % 2 && part != @"") {
			[tokens addObject: @[ @"text", part ]];
		} else {
			[tokens addObject: @[ @"tag", part ]];
		}
	}
	
	return [tokens copy];
}

-(NSString *)processEscapes:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:
			@[ @"\\\\", @"\\\"", @"\\'", @"\\.", @"\\-", @"\\`" ]
											withStrings:
			@[ @"&#92;", @"&#34;", @"&#39;", @"&#46;", @"&#45;", @"&#96;" ]
			];
}

-(NSString *)educateQuotes:(NSString *)input {
	
	NSMutableString *s = [input mutableCopy];
	
	// Special case if the very first character is a quote
	// followed by punctuation at a non-word-break. Close the quotes by brute force:
	
	[s replaceOccurrencesOfMatch:@"^'(?=[:PUNCT:]\\B)"
					  withString:@"&#8217;"];
	
	[s replaceOccurrencesOfMatch:@"^\"(?=[:PUNCT:]\\B)"
					  withString:@"&#8221;"];
	
	// Special case for double sets of quotes, e.g.:
	// <p>He said, "'Quoted' words in a larger quote."</p>
	
	[s replaceOccurrencesOfMatch:@"\"'(?=\\w)"
					  withString:@"&#8220;&#8216;"];
	
	[s replaceOccurrencesOfMatch:@"'\"(?=\\w)"
					  withString:@"&#8216;&#8220;"];
	
	// Special case for decade abbreviations (the '80s):
	
	[s replaceOccurrencesOfMatch:@"'(?=\\d{2}s)"
					  withString:@"&#8217;"];
	
	// Get most opening single quotes:
	
	[s replaceOccurrencesOfMatch:@"(^|\\s|&nbsp;|--|&[mn]dash;|&#8211;|&#8212;|&#x201[34];)'(?=\\w)"
					  withString:@"$1&#8216;"];
	
	// Single closing quotes:
	
	[s replaceOccurrencesOfMatch:@"([^ \t\r\n\\[\\{\\(\\-])?'"
					  withString:@"$1&#8217;"];
	// (Removing (?(1)|(?=\\s|s\\b)) in comparison to the original, because NSRegularExpression does not support conditionals.)
	
	// Any remaining single quotes should be opening ones:
	
	[s replaceOccurrencesOfString:@"'"
					   withString:@"&#8216;"
						  options:0
							range:NSMakeRange(0, [s length])];
	
	// Get most opening double quotes:
	
	[s replaceOccurrencesOfMatch:@"(^|\\s|&nbsp;|--|&[mn]dash;|&#8211;|&#8212;|&#x201[34];)\"(?=\\w)"
					  withString:@"$1&#8220;"];
	
	// Double closing quotes:
	
	[s replaceOccurrencesOfMatch:@"([^ \t\r\n\\[\\{\\(\\-])?\""
					  withString:@"$1&#8221;"];
	
	// Any remaining quotes should be opening ones.
	
	[s replaceOccurrencesOfString:@"\""
					   withString:@"&#8220;"
						  options:0
							range:NSMakeRange(0, [s length])];
	
	return [s copy];
}

-(NSString *)educateBackticks:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:
			@[ @"``", @"''" ]
											withStrings:
			@[ @"&#8220;", @"&#8221;" ]
			];
}

-(NSString *)educateSingleBackticks:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:
			@[ @"`", @"'" ]
											withStrings:
			@[ @"&#8216;", @"&#8217;" ]
			];
}

-(NSString *)educateDashes:(NSString *)input {
	return [input stringByReplacingOccurrencesOfString:@"--" withString:@"&#8212;"];
}

-(NSString *)educateDashesOldSchool:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:
			@[ @"---", @"--" ]
											withStrings:
			@[ @"&#8212;", @"&#8211;" ]
			];
}

-(NSString *)educateDashesOldSchoolInverted:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:
			@[ @"---", @"--" ]
											withStrings:
			@[ @"&#8211;", @"&#8212;" ]
			];
}

-(NSString *)educateEllipses:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:@[@"...", @". . ."] withString:@"&#8230;"];
}

-(NSString *)stupefyEntities:(NSString *)input {
	return [input stringByReplacingOccurrencesOfStrings:
			@[@"&#8211;", @"&#8212;", @"&#8216;", @"&#8217;", @"&#8220;", @"&#8221;", @"&#8230;"]
											withStrings:
			@[@"-", @"--", @"'", @"'", @"\"", @"\"", @"..."]
			];
}

-(NSString *)educateString:(NSString *)input withPrevTokenLastChar:(NSString *)ptLastChar {
	input = [self processEscapes:input];
	
	if (self.convertQuot) {
		input = [input stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
	}
	
	// Dashes
	
	if (self.doDashes) {
		if (self.doDashes == SmartyPantsAttributeOn) {
			input = [self educateDashes:input];
		} else if (self.doDashes == SmartyPantsAttributeAlternative) {
			input = [self educateDashesOldSchool:input];
		} else if (self.doDashes == SmartyPantsAttributeInverted) {
			input = [self educateDashesOldSchoolInverted:input];
		}
	}
	
	// Ellipses
	
	if (self.doEllipses) {
		input = [self educateEllipses:input];
	}
	
	// Backticks
	
	// Note: Backticks need to be processed before quotes.
	
	if (self.doBackticks) {
		input = [self educateBackticks:input];
		if (self.doBackticks == SmartyPantsAttributeAlternative) {
			input = [self educateSingleBackticks:input];
		}
	}
	
	// Quotes
	
	if (self.doQuotes) {
		if ([input isEqualToString:@"'"]) {
			// Special case: single-character ' token
			NSRegularExpression *re = [self getRE:@"\\S"];
			if ([re numberOfMatchesInString:ptLastChar options:NSMatchingReportCompletion range:NSMakeRange(0, [ptLastChar length])]) {
				input = @"&#8217;";
			} else {
				input = @"&#8216;";
			}
		} else if ([input isEqualToString:@"\""]) {
			// Special case: single-character " token
			NSRegularExpression *re = [self getRE:@"\\S"];
			if ([re numberOfMatchesInString:ptLastChar options:NSMatchingReportCompletion range:NSMakeRange(0, [ptLastChar length])]) {
				input = @"&#8221;";
			} else {
				input = @"&#8220;";
			}
		} else {
			// Normal case:
			input = [self educateQuotes:input];
		}
	}
	
	// Stupefy
	
	if (self.doStupefy) {
		input = [self stupefyEntities:input];
	}
	
	return input;
}

-(NSString *)transformString:(NSString *)input {
	if (![self doSomething]) {
		return input;
	}
	
	NSArray *tokens = [self tokenizeHTMLString:input];
	NSMutableString *result = [NSMutableString string];
	BOOL inPre = NO;
	
	NSString *prevTokenLastChar = [NSString string];
	
	for (NSArray *token in tokens) {
		if ([token[0] isEqualToString:@"tag"]) {
			// Don't mess with quotes inside tags.
			[result appendString:token[1]];
			
			NSRegularExpression *re = [self getRE:[NSString stringWithFormat:@"<(/?)(?:%@)[\\s>]", SMARTYPANTS_TAGS_TO_SKIP]];
			NSTextCheckingResult *match = [re firstMatchInString:token[1] options:NSMatchingReportCompletion range:NSMakeRange(0, [token[1] length])];
			
			if (match != nil) {
				// First capture group is a / in a closing element, or nothing in an opening element.
				NSString *slash = [token[1] substringWithRange:[match rangeAtIndex:1]];
				if ([slash length] > 0) {
					inPre = NO;
				} else {
					inPre = YES;
				}
			}
		} else {
			NSString *t = [NSString stringWithString:token[1]];
			// Remember last char of this token before processing.
			NSString *lastChar = [t lastCharacter];
			if (!inPre) {
				t = [self educateString:t withPrevTokenLastChar:prevTokenLastChar];
			}
			prevTokenLastChar = lastChar;
			[result appendString:t];
		}
	}
	
	return result;
}

// QUICK TRANSFORMATION CLASS METHODS

+(NSString *)transformString:(NSString *)input {
	return [[self class] transformString:input usingAttributes:1];
}

+(NSString *)transformString:(NSString *)input usingAttributes:(int)attr {
	SmartyPantsParser *sp = [[[self class] alloc] initWithAttributes:attr];
	return [sp transformString:input];
}

+(NSString *)transformString:(NSString *)input usingAttributeString:(NSString *)attrString {
	SmartyPantsParser *sp = [[[self class] alloc] initWithAttributeString:attrString];
	return [sp transformString:input];
}

// SHORTHANDS

+(NSString *)smartQuotes:(NSString *)input {
	return [[self class] smartQuotes:input usingAttributes:1];
}
+(NSString *)smartQuotes:(NSString *)input usingAttributes:(int)attr {
	NSString *attrString;
	switch (attr) {
		case 0:  return input;
		case 2:  attrString = @"qb"; break;
		default: attrString = @"q"; break;
	}
	return [[self class] transformString:input usingAttributeString:attrString];
}

+(NSString *)smartDashes:(NSString *)input {
	return [[self class] smartDashes:input usingAttributes:1];
}
+(NSString *)smartDashes:(NSString *)input usingAttributes:(int)attr {
	NSString *attrString;
	switch (attr) {
		case 0:  return input;
		case 2:  attrString = @"D"; break;
		case 3:  attrString = @"i"; break;
		default: attrString = @"d"; break;
	}
	return [[self class] transformString:input usingAttributeString:attrString];
}

+(NSString *)smartEllipses:(NSString *)input {
	return [[self class] smartEllipses:input usingAttributes:1];
}
+(NSString *)smartEllipses:(NSString *)input usingAttributes:(int)attr {
	NSString *attrString;
	switch (attr) {
		case 0:  return input;
		default: attrString = @"e"; break;
	}
	return [[self class] transformString:input usingAttributeString:attrString];
}

@end
