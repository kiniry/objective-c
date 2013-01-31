//
//  Matcher.m
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "Matcher.h"

@interface Matcher ()

@property NSString* input;
@property NSUInteger position;
@property NSUInteger appendPosition;
@property NSRange range;
@property NSTextCheckingResult* checkingResult;
@property (readonly) BOOL matchFound;
@property BOOL patternChanged;

- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input position:(NSUInteger)position appendPosition:(NSUInteger)appendPosition range:(NSRange)range checkingResult:(NSTextCheckingResult*)checkingResult patternChanged:(NSUInteger)patternChanged anchoringBounds:(BOOL)anchoringBounds transparentBounds:(BOOL)transparentBounds;
- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input;
- (void)performMatch;

@end

@interface RegexPattern ()

// expose property from RegexPattern
@property NSRegularExpression* regex;

@end

@implementation Matcher

+ (NSString*)quoteReplacement:(NSString*)replacement {
  return [NSRegularExpression escapedTemplateForString:replacement];
}

- (id)initWithPattern:(RegexPattern*)pattern
                input:(NSString*)input
             position:(NSUInteger)position
       appendPosition:(NSUInteger)appendPosition
                range:(NSRange)range
       checkingResult:(NSTextCheckingResult*)checkingResult
       patternChanged:(NSUInteger)patternChanged
      anchoringBounds:(BOOL)anchoringBounds
    transparentBounds:(BOOL)transparentBounds {
  self = [super init];
  if (self) {
    _pattern = pattern;
    _input = input;
    _position = position;
    _appendPosition = appendPosition;
    _range = range;
    _anchoringBounds = anchoringBounds;
    _transparentBounds = transparentBounds;
  }
  return self;
}

- (id)initWithPattern:(RegexPattern*)pattern input:(NSString*)input; {
  return [self initWithPattern:pattern
                         input:input
                      position:0
                appendPosition:0
                         range:NSMakeRange(0, [input length])
                checkingResult:nil
                patternChanged:NO
               anchoringBounds:YES
             transparentBounds:NO];
}

- (void)performMatch {
  NSMatchingOptions matchingOptions = 0;
  if (self.transparentBounds)
    matchingOptions |= NSMatchingWithTransparentBounds;
  if (!self.anchoringBounds)
    matchingOptions |= NSMatchingWithoutAnchoringBounds;

  NSRange searchRange = NSMakeRange(self.position, self.range.length - (self.position - self.range.location));
  self.checkingResult = [self.pattern.regex firstMatchInString:self.input options:matchingOptions range:searchRange];

  if (!self.checkingResult || self.checkingResult.range.location == NSNotFound) {
    self.position++;
  } else {
    self.position = self.checkingResult.range.location + self.checkingResult.range.length;
  }
}

- (BOOL)matchFound {
  return self.checkingResult && self.checkingResult.range.location != NSNotFound;
}

- (id <MatchResult>)toMatchResult {
  id <MatchResult> matchResult = [[[self class] alloc] initWithPattern:self.pattern
                                  input:self.input
                               position:self.position
                         appendPosition:self.appendPosition
                                  range:self.range
                         checkingResult:self.checkingResult
                         patternChanged:self.patternChanged
                        anchoringBounds:self.anchoringBounds
                      transparentBounds:self.transparentBounds];
  return matchResult;
}

- (void)setPattern:(RegexPattern *)pattern {
  if (!pattern)
    [NSException raise:NSInvalidArgumentException format:@"Pattern cannot be nil"];

  _pattern = pattern;

  self.patternChanged = YES;
}

- (void)reset {
  self.patternChanged = NO;

  self.position = 0;
  self.appendPosition = 0;
  self.range = NSMakeRange(0, [self.input length]);
  self.checkingResult = nil;
}

- (void)resetWithInput:(NSString*)input {
  self.input = [input copy];
  [self reset];
}

- (BOOL)matches {
  self.patternChanged = NO;

  // It's not possible to force a greedy match using NSRegularException
  // Hacky workaround: Append $ to the end of the pattern

  NSMatchingOptions matchingOptions = 0;
  if (self.transparentBounds)
    matchingOptions |= NSMatchingWithTransparentBounds;
  if (!self.anchoringBounds)
    NSAssert(NO, @"Unimplemented!"); // I can't figure how to support the NSMatchingWithoutAnchoringBounds option using the hack below

  NSError* error = NULL;
  NSRegularExpression* greedyRegex = [NSRegularExpression regularExpressionWithPattern:[self.pattern.pattern stringByAppendingString:@"$"] options:0 error:&error]; // no options specified
  if (error)
    [NSException raise:NSInternalInconsistencyException format:@"Greedy hack didn't work :("];

  self.checkingResult = [greedyRegex firstMatchInString:self.input options:matchingOptions range:self.range];

  if (self.checkingResult && NSEqualRanges(self.checkingResult.range, self.range)) {
    self.position = self.range.location + self.range.length;
    return YES;
  }

  self.position = self.range.location + self.range.length - 1;
  self.checkingResult = nil;
  return NO;
}

- (BOOL)find {
  self.patternChanged = NO;

  [self performMatch];
  return self.matchFound;
}

- (BOOL)findFromIndex:(NSUInteger)start {
  if (start > self.input.length)
    [NSException raise:NSRangeException format:@"Illegal start index"];

  [self reset];
  self.position = start;

  return [self find];
}

- (BOOL)lookingAt {
  [self performMatch];

  return self.checkingResult && self.checkingResult.range.location == self.range.location;
}

- (void)appendReplacement:(NSString*)replacement toString:(NSMutableString*)aMutableString {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];

  // replace occurences of $g with [self groupWithIndex:g] in the replacement string
  NSError* error = NULL;
  NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(?<!\\\\)\\$([1-9][0-9]*)" options:0 error:&error];
  if (error)
    [NSException raise:NSInternalInconsistencyException format:@"This shouldn't happen xD"];

  NSMutableString* replacementWithGroups = [NSMutableString string];
  __block NSUInteger appendPosition = 0; // local append position

  NSRange searchRange = NSMakeRange(0, [replacement length]);
  [regex enumerateMatchesInString:replacement options:0 range:searchRange usingBlock:^(NSTextCheckingResult* result, NSMatchingFlags flags, BOOL* stop) {
    NSUInteger groupIndex = [[replacement substringWithRange:[result rangeAtIndex:1]] integerValue];
    if (groupIndex > [self groupCount]) {
      [NSException raise:NSRangeException format:@"No group %lu", groupIndex];
      *stop = YES;
    }

    // append what comes after the last match and before this match
    NSRange rangeBetweenMatches = NSMakeRange(appendPosition, result.range.location - appendPosition);
    [replacementWithGroups appendString:[replacement substringWithRange:rangeBetweenMatches]];
    appendPosition = result.range.location + result.range.length; // update local append position

    // append value of group
    [replacementWithGroups appendString:[self groupWithIndex:groupIndex]];
  }];

  // append the rest
  NSRange rangeOfTheRest = NSMakeRange(appendPosition, [replacement length] - appendPosition);
  [replacementWithGroups appendString:[replacement substringWithRange:rangeOfTheRest]];

  // append the following to the given mutable string
  // 1. everything from self.appendPosition to before the match
  // 2. the replacement string with the groups inserted
  NSRange fromAppendPositionToBeforeMatch = NSMakeRange(self.appendPosition, [self start] - self.appendPosition);
  [aMutableString appendString:[self.input substringWithRange:fromAppendPositionToBeforeMatch]];
  [aMutableString appendString:replacementWithGroups];

  self.appendPosition = [self end]; // update the append position
}

- (void)appendTailToString:(NSMutableString*)aMutableString {
  // append the following to the given mutable string
  // 1. everything from self.appendPosition to the end of the input string
  NSRange fromAppendPositionToEndOfRegion = NSMakeRange(self.appendPosition, self.range.length - (self.appendPosition - self.range.location));
  [aMutableString appendString:[self.input substringWithRange:fromAppendPositionToEndOfRegion]];

  self.appendPosition = self.range.location + self.range.length; // update the append position
}

- (NSString*)replaceAllWithReplacement:(NSString*)replacement {
  [self reset];

  NSMutableString *mutableString = [NSMutableString string];
  while (self.find)
    [self appendReplacement:replacement toString:mutableString];
  [self appendTailToString:mutableString];
  return mutableString;
}

- (NSString*)replaceFirstWithReplacement:(NSString*)replacement {
  [self reset];

  NSMutableString *mutableString = [NSMutableString string];
  if (self.find)
    [self appendReplacement:replacement toString:mutableString];
  [self appendTailToString:mutableString];
  return mutableString;
}

- (void)setRegionFromIndex:(NSUInteger)start toIndex:(NSUInteger)end {
  if (start > self.input.length)
    [NSException raise:NSRangeException format:@"Start index out of bounds"];
  if (end > self.input.length)
    [NSException raise:NSRangeException format:@"End index out of bounds"];
  if (start > end)
    [NSException raise:NSRangeException format:@"Start index is greater than end index"];

  [self reset];
  self.range = NSMakeRange(start, end - start);
}

- (NSUInteger)regionStart {
  return self.range.location;
}

- (NSUInteger)regionEnd {
  return self.range.location + self.range.length;
}

- (BOOL)hasHitEnd {
  return self.position == self.range.location + self.range.length + 1;
}

- (BOOL)requiresEnd {
  NSAssert(NO, @"Unimplemented!");
  return NO;
}

- (NSUInteger)start {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];

  NSRange groupRange = self.checkingResult.range;
  return groupRange.location;
}

- (NSInteger)startOfGroup:(NSUInteger)groupIndex {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];
  if (groupIndex > [self groupCount])
    [NSException raise:NSRangeException format:@"No group %lu", groupIndex];

  if (self.patternChanged)
    return -1;

  NSRange groupRange = [self.checkingResult rangeAtIndex:groupIndex];
  return groupRange.location;
}

- (NSUInteger)end {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];

  NSRange groupRange = self.checkingResult.range;
  return groupRange.location + groupRange.length;
}

- (NSInteger)endOfGroup:(NSUInteger)groupIndex {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match available"];
  if (groupIndex > [self groupCount])
    [NSException raise:NSRangeException format:@"No group %lu", groupIndex];

  if (self.patternChanged)
    return -1;

  NSRange groupRange = [self.checkingResult rangeAtIndex:groupIndex];
  return groupRange.location + groupRange.length;
}

- (NSString*)group {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match found"];

  if (self.patternChanged)
    return nil;

  return [self.input substringWithRange:self.checkingResult.range];
}

- (NSString*)groupWithIndex:(NSUInteger)groupIndex {
  if (!self.matchFound)
    [NSException raise:NSInternalInconsistencyException format:@"No match found"];
  if (groupIndex > [self groupCount])
    [NSException raise:NSRangeException format:@"No group %lu", groupIndex];

  if (self.patternChanged)
    return nil;

  NSRange groupRange = [self.checkingResult rangeAtIndex:groupIndex];
  if (groupRange.location == NSNotFound)
    return nil;

  return [self.input substringWithRange:groupRange];
}

- (NSUInteger)groupCount {
  return self.pattern.regex.numberOfCaptureGroups;
}

- (NSString*)description {
  return [NSString stringWithFormat:@"%@ %@", [super description], self.input];
}

@end
