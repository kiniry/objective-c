//
//  RegexPattern.h
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Matcher.h"

@class Matcher;

typedef NS_OPTIONS(NSUInteger, RegexPatternOptions) {
  RegexPatternCanonicalEquivalence = 1 << 0,
  RegexPatternCaseInsensitive      = 1 << 1,
  RegexPatternComments             = 1 << 2,
  RegexPatternDotAll               = 1 << 3,
  RegexPatternLiteral              = 1 << 4,
  RegexPatternMutiline             = 1 << 5,
  RegexPatternUnicodeCase          = 1 << 6,
  RegexPatternUnixLines            = 1 << 7
};

@interface RegexPattern : NSObject

@property (readonly) RegexPatternOptions options;
@property (readonly) NSString* pattern;

+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression error:(NSError**)error;
+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error;
+ (BOOL)regularExpression:(NSString*)regularExpression matchesString:(NSString*)aString;
+ (NSString*)quoteString:(NSString*)aString;

- (Matcher*)matcherWithInput:(NSString*)input;
- (NSArray*)splitUsingString:(NSString*)aString;
- (NSArray*)splitUsingString:(NSString*)aString withLimit:(NSUInteger)limit;

@end
