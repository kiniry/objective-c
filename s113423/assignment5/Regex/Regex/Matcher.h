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

+ (NSString*)quoteReplacement:(NSString*)replacement;

- (id <MatchResult>)toMatchResult;
- (void)reset;
- (void)resetWithInput:(NSString*)input;
- (BOOL)matches;
- (BOOL)find;
- (BOOL)findFromIndex:(NSUInteger)start;
- (BOOL)lookingAt;
- (void)appendReplacement:(NSString*)replacement toString:(NSMutableString*)aMutableString;
- (void)appendTailToString:(NSMutableString*)aMutableString;
- (NSString*)replaceAllWithReplacement:(NSString*)replacement;
- (NSString*)replaceFirstWithReplacement:(NSString*)replacement;
- (void)setRegionFromIndex:(NSUInteger)start toIndex:(NSUInteger)end;
- (NSUInteger)regionStart;
- (NSUInteger)regionEnd;
- (BOOL)hasHitEnd;
- (BOOL)requiresEnd;

@end
