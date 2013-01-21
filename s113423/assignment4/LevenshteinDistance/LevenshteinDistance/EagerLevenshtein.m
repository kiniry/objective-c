//
//  EagerLevenshtein.m
//  EagerLevenshtein
//
//  Created by Salvador Jacobi on 18/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "EagerLevenshtein.h"

#define MIN3(A,B,C) ({ \
__typeof__(A) __a = (A); \
__typeof__(B) __b = (B); \
__typeof__(C) __c = (C); \
__a < __b ? (__a < __c ? __a : __c) : (__b < __c ? __b : __c); })

@implementation EagerLevenshtein

+ (id)sharedInstance {
  static id _sharedObject = nil;
  if (!_sharedObject) {
    _sharedObject = [[super allocWithZone:NULL] init];
  }
  return _sharedObject;
}

+ (id)allocWithZone:(NSZone *)zone {
  return [[self sharedInstance] retain];
}

- (NSUInteger)distanceFrom:(NSString*)stringA to:(NSString*)stringB {
  NSUInteger lengthA = [stringA length];
  NSUInteger lengthB = [stringB length];

  if (lengthA == 0) return lengthB;
  if (lengthB == 0) return lengthA;

  NSUInteger cost = 0;
  if ([stringA characterAtIndex:0] != [stringB characterAtIndex:0]) {
    cost = 1;
  }

  NSUInteger distanceA = [self distanceFrom:[stringA substringFromIndex:1] to:stringB] + 1;
  NSUInteger distanceB = [self distanceFrom:stringA to:[stringB substringFromIndex:1]] + 1;
  NSUInteger distanceC = [self distanceFrom:[stringA substringFromIndex:1] to:[stringB substringFromIndex:1]] + cost;

  return MIN3(distanceA, distanceB, distanceC);
}

@end
