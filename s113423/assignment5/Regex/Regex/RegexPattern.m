//
//  RegexPattern.m
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "RegexPattern.h"

@interface RegexPattern ()

@property NSRegularExpression* regex;
@property RegexPatternOptions options;

- (id)initWithRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error;

@end


// expose private initializer of Matcher
@interface Matcher ()

- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input;

@end

@implementation RegexPattern

// RegexPattern.h
- (id)initWithRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error {
  self = [super init];
  if (self) {
    // TODO: translate options from java.util.regex.Pattern to NSRegularExpression...
    _options = options;
    _pattern = regularExpression;

    _regex = [NSRegularExpression regularExpressionWithPattern:regularExpression options:0 error:error];
  }
  return self;
}

+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression options:(RegexPatternOptions)options error:(NSError**)error {
  return [[RegexPattern alloc] initWithRegularExpression:regularExpression options:options error:error];
}

+ (RegexPattern*)compileRegularExpression:(NSString*)regularExpression error:(NSError**)error {
  return [self compileRegularExpression:regularExpression options:0 error:error];
}

+ (BOOL)regularExpression:(NSString*)regularExpression matchesString:(NSString*)aString {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

+ (NSString*)quoteString:(NSString*)aString {
  NSAssert(NO, @"Unimplemented!");
  return @"";
}

- (Matcher*)matcherWithInput:(NSString*)input {
  Matcher* matcher = [[Matcher alloc] initWithPattern:self input:input];

  return matcher;
}

- (NSArray*)splitUsingString:(NSString*)aString {
  NSAssert(NO, @"Unimplemented!");
  return [[NSArray alloc] init];
}

- (NSArray*)splitUsingString:(NSString*)aString withLimit:(NSUInteger)limit {
  NSAssert(NO, @"Unimplemented!");
  return [[NSArray alloc] init];
}

// NSObject.h
- (NSString*)description {
  NSAssert(NO, @"Unimplemented!");
  return [super description];
}

@end
