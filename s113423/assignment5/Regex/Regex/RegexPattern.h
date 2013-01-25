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
  RegexPatternUnixLines            = 1 << 0,
  RegexPatternCaseInsensitive      = 1 << 1,
  RegexPatternComments             = 1 << 2,
  RegexPatternMutiline             = 1 << 3,
  RegexPatternLiteral              = 1 << 4,
  RegexPatternDotAll               = 1 << 5,
  RegexPatternUnicodeCase          = 1 << 6,
  RegexPatternCanonicalEquivalence = 1 << 7
};

@interface RegexPattern : NSObject

@property (readonly) NSString* pattern;
@property (readonly) RegexPatternOptions options;

+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression error:(NSError**)error;
+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error;
+ (BOOL)regularExpression:(NSString*)regularExpression matchesString:(NSString*)aString error:(NSError**)error;
+ (NSString*)quoteString:(NSString*)aString;

- (Matcher*)matcherWithInput:(NSString*)input;
- (NSArray*)splitString:(NSString*)aString withLimit:(NSUInteger)limit;
- (NSArray*)splitString:(NSString*)aString;

@end
