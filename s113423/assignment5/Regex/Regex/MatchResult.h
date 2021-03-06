//
//  MatchResult.h
//  Regex
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MatchResult <NSObject>

- (NSUInteger)start;
- (NSInteger)startOfGroup:(NSUInteger)groupIndex;
- (NSUInteger)end;
- (NSInteger)endOfGroup:(NSUInteger)groupIndex;
- (NSString*)group;
- (NSString*)groupWithIndex:(NSUInteger)groupIndex;
- (NSUInteger)groupCount;

@end
