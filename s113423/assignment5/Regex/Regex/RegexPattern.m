//
//  RegexPattern.m
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "RegexPattern.h"

@interface RegexPattern ()

@property RegexPatternOptions options;
@property NSRegularExpression* regex;

- (id)initWithRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error;

@end

// expose private initializer of Matcher
@interface Matcher ()

- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input;

@end

@implementation RegexPattern

+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression error:(NSError**)error {
  return [self compileRegularExpression:regularExpression options:0 error:error];
}

+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error {
  return [[RegexPattern alloc] initWithRegularExpression:regularExpression options:options error:error];
}

+ (BOOL)regularExpression:(NSString*)regularExpression matchesString:(NSString*)aString error:(NSError**)error {
  RegexPattern* pattern = [self compileRegularExpression:regularExpression error:error];
  if (*error)
    return NO;
  return [[pattern matcherWithInput:aString] matches];
}

+ (NSString*)quoteString:(NSString*)aString {
  return [NSRegularExpression escapedPatternForString:aString];
}

- (id)initWithRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error {
  self = [super init];
  if (self) {
    _options = options;
    _pattern = regularExpression;
    // TODO: translate options from java.util.regex.Pattern to NSRegularExpression...
    _regex = [NSRegularExpression regularExpressionWithPattern:regularExpression options:0 error:error];
  }
  return self;
}

- (Matcher*)matcherWithInput:(NSString*)input {
  Matcher* matcher = [[Matcher alloc] initWithPattern:self input:input];
  return matcher;
}

- (NSArray*)splitString:(NSString*)aString withLimit:(NSUInteger)limit {
  NSMutableArray* result = [NSMutableArray array];
  Matcher* matcher = [self matcherWithInput:aString];
  NSMutableString* mutableString;
  
  // limit the number of times the pattern is applied if limit > 0
  for (NSUInteger i = 0; (limit <= 0 || i < limit - 1) && [matcher find]; i++) {
    mutableString = [NSMutableString string];
    [matcher appendReplacement:@"" toString:mutableString];
    [result addObject:mutableString];
  }
  
  mutableString = [NSMutableString string];
  [matcher appendTailToString:mutableString];
  [result addObject:mutableString];
  
  // discard trailing empty strings if limit is 0
  if (limit == 0) {
    while ([[result lastObject] isEqualToString:@""]) {
      [result removeLastObject];
    }
  }
  
  return result;
}

- (NSArray*)splitString:(NSString*)aString {
  return [self splitString:aString withLimit:0];
}

- (NSString*)description {
  return [NSString stringWithFormat:@"%@ %@ 0x%lx", [super description], self.pattern, self.options];
}

@end
