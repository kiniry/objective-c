//
//  Matcher.m
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "Matcher.h"

@interface Matcher ()

@property (setter=setMatches:) BOOL matches;

@property NSUInteger position;
@property NSString* input;
@property NSRange range;
@property NSTextCheckingResult* textCheckingResult;

- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input;
- (void)performMatch;

@end

// expose setter of readonly property of RegexPattern (code smell?)
@interface RegexPattern ()

@property NSRegularExpression* regex;

@end

@implementation Matcher

// MatcherResult.h
- (NSUInteger)start {
  if (!self.matches)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];
  NSAssert(NO, @"Unimplemented!");
  return 0;
}

- (NSUInteger)startOfGroup:(NSUInteger)groupIndex {
  if (!self.matches)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];
  if (groupIndex > [self groupCount])
    [NSException raise:NSRangeException format:@"No group %lu", groupIndex];
  
  NSAssert(NO, @"Unimplemented!");
  return 0;
}

- (NSUInteger)end {
  if (!self.matches)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];

  NSAssert(NO, @"Unimplemented!");
  return 0;
}

- (NSUInteger)endOfGroup:(NSUInteger)groupIndex {
  if (!self.matches)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];
  if (groupIndex > [self groupCount])
    [NSException raise:NSRangeException format:@"No group %lu", groupIndex];

  NSAssert(NO, @"Unimplemented!");
  return 0;
}

- (NSString*)group {
  if (!self.matches)
    [NSException raise:NSInternalInconsistencyException format:@"No match found"];

  return [self.input substringWithRange:self.range];
}

- (NSString*)groupWithIndex:(NSUInteger)groupIndex {
  if (!self.matches)
    [NSException raise:NSInternalInconsistencyException format:@"No match found"];
  if (groupIndex > [self groupCount])
    [NSException raise:NSRangeException format:@"No group %lu", groupIndex];

  NSRange groupRange = [self.textCheckingResult rangeAtIndex:groupIndex];
  if (groupRange.location == NSNotFound)
    return nil;

  return [self.input substringWithRange:groupRange];
}

- (NSUInteger)groupCount {
  return self.pattern.regex.numberOfCaptureGroups;
}

// Matcher.h
- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input; {
  self = [super init];
  if (self) {
    _pattern = pattern;
    _input = input;

    _position = 0;
    _range = NSMakeRange(0, [_input length]);
    
    _anchoringBounds = YES;
    _transparentBounds = NO;

    [self performMatch];
  }
  return self;
}

- (void)performMatch {
  NSMatchingOptions matchingOptions = 0;
  if (self.hasTransparentBounds) matchingOptions |= NSMatchingWithTransparentBounds;
  if (!self.hasAnchoringBounds) matchingOptions |= NSMatchingWithoutAnchoringBounds;

  self.textCheckingResult = [self.pattern.regex firstMatchInString:self.input options:matchingOptions range:self.range];
  self.matches = NSEqualRanges(self.textCheckingResult.range, self.range);
}

- (void)appendReplacement:(NSString*)replacement toString:(NSMutableString*)aMutableString {
  NSAssert(NO, @"Unimplemented!");
}

- (void)appendTailToString:(NSMutableString*)aMutableString {
  NSAssert(NO, @"Unimplemented!");
}

- (BOOL)find {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

- (BOOL)findFromIndex:(NSUInteger)start {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

- (BOOL)hasHitEnd {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

- (BOOL)lookingAt {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

- (void)setRegionFromIndex:(NSUInteger)start toIndex:(NSUInteger)end {
  NSAssert(start <= self.input.length, @"start should be less than or equal to length of input string");
  NSAssert(end <= self.input.length, @"end should be less than or equal to length of input string");
  NSAssert(start <= end, @"start should be less than or equal to end");

  self.position = 0;
  self.range = NSMakeRange(start, end - start);
  
  [self performMatch];
}

- (NSUInteger)regionStart {
  return self.range.location;
}

- (NSUInteger)regionEnd {
  return self.range.location + self.range.length;
}

- (NSString*)replaceAllWithReplacement:(NSString*)replacement {
  NSAssert(NO, @"Unimplemented!");
  return @"";
}

- (NSString*)replaceFirstWithReplacement:(NSString*)replacement {
  NSAssert(NO, @"Unimplemented!");
  return @"";
}

- (BOOL)requiresEnd {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

- (void)reset {
  self.position = 0;
  self.range = NSMakeRange(0, [self.input length]);

  [self performMatch];
}

- (void)resetWithInput:(NSString*)input {
  self.input = [input copy];

  self.position = 0;
  self.range = NSMakeRange(0, [self.input length]);

  [self performMatch];
}

- (id <MatchResult>)toMatchResult {
  return self;
}

- (void)setPattern:(RegexPattern *)pattern {
  _pattern = pattern;
  [self performMatch];
}

+ (NSString*)quoteReplacement:(NSString*)replacement {
  NSAssert(NO, @"Unimplemented!");
  return @"";
}

// NSObject.h
- (NSString*)description {
  NSAssert(NO, @"Unimplemented!");
  return [super description];
}

@end
