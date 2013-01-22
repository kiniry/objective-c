//
//  Matcher.h
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MatchResult.h"

#import "RegexPattern.h"

@class RegexPattern;

@interface Matcher : NSObject <MatchResult>

@property (nonatomic) RegexPattern* pattern;
@property (setter=useAnchoringBounds:, getter=hasAnchoringBounds) BOOL anchoringBounds;
@property (setter=useTransparentBounds:, getter=hasTransparentBounds) BOOL transparentBounds;
@property (readonly) BOOL matches;

+ (NSString*)quoteReplacement:(NSString*)replacement;

- (void)appendReplacement:(NSString*)replacement toString:(NSMutableString*)aMutableString;
- (void)appendTailToString:(NSMutableString*)aMutableString;
- (BOOL)find;
- (BOOL)findFromIndex:(NSUInteger)start;
- (BOOL)hasHitEnd;
- (BOOL)lookingAt; // weird method name...
- (void)setRegionFromIndex:(NSUInteger)start toIndex:(NSUInteger)end;
- (NSUInteger)regionStart;
- (NSUInteger)regionEnd;
- (NSString*)replaceAllWithReplacement:(NSString*)replacement;
- (NSString*)replaceFirstWithReplacement:(NSString*)replacement;
- (BOOL)requiresEnd;
- (void)reset;
- (void)resetWithInput:(NSString*)input;
- (id <MatchResult>)toMatchResult; // is this necessary? upcast would do the same

@end
