//
//  MemoizedLevenshtein.m
//  LevenshteinDistance
//
//  Created by Salvador Jacobi on 19/1/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "MemoizedLevenshtein.h"

#define MIN3(A,B,C) ({ \
__typeof__(A) __a = (A); \
__typeof__(B) __b = (B); \
__typeof__(C) __c = (C); \
__a < __b ? (__a < __c ? __a : __c) : (__b < __c ? __b : __c); })

@implementation MemoizedLevenshtein

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

- (NSUInteger)distanceFrom:(NSString*)stringA withIndex:(NSUInteger)indexA length:(NSUInteger)lengthA
                        to:(NSString*)stringB withIndex:(NSUInteger)indexB length:(NSUInteger)lengthB
                  withMemo:(NSMutableDictionary*)memo{
  NSString* key = [[NSString alloc] initWithFormat:@"%lu,%lu,%lu,%lu", indexA, lengthA, indexB, lengthB];
  NSNumber* value = [memo objectForKey:key];
  if (value) {
    NSUInteger result = [value unsignedIntegerValue];
    [key release];
    return result;
  }

  if (lengthA == 0) {
    [key release];
    return lengthB;
  }

  if (lengthB == 0) {
    [key release];
    return lengthA;
  }

  NSUInteger cost = 0;
  if ([stringA characterAtIndex:indexA] != [stringB characterAtIndex:indexB]) {
    cost = 1;
  }

  NSUInteger distanceA = [self distanceFrom:stringA withIndex:(indexA + 1) length:(lengthA - 1)
                                         to:stringB withIndex:indexB       length:lengthB
                                   withMemo:memo] + 1;
  NSUInteger distanceB = [self distanceFrom:stringA withIndex:indexA       length:lengthA
                                         to:stringB withIndex:(indexB + 1) length:(lengthB - 1)
                                   withMemo:memo] + 1;
  NSUInteger distanceC = [self distanceFrom:stringA withIndex:(indexA + 1) length:(lengthA - 1)
                                         to:stringB withIndex:(indexB + 1) length:(lengthB - 1)
                                   withMemo:memo] + cost;

  NSUInteger result = MIN3(distanceA, distanceB, distanceC);

  NSNumber* object = [[NSNumber alloc] initWithUnsignedInteger:result];
  [memo setObject:object forKey:key];
  [object release];
  [key release];

  return result;
}

- (NSUInteger)distanceFrom:(NSString*)stringA to:(NSString*)stringB {
  NSMutableDictionary* memo = [[NSMutableDictionary alloc] init];
  NSUInteger result = [self distanceFrom:stringA withIndex:0 length:[stringA length]
                                      to:stringB withIndex:0 length:[stringB length]
                                withMemo:memo];
  [memo release];
  return result;
}

@end
