//
//  MethodInvocation.m
//  Assignment4
//
//  Created by Salvador Jacobi on 27/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "MethodInvocation.h"

#include <mach/mach_time.h>
#include <stdint.h>
#include <stdio.h>

#define ITERATIONS 100000000

double multiplyFunction(double a, double b) {
  return MIN(a * b, b);
}

@implementation MethodInvocation

+ (double)multiply:(double)a by:(double)b {
  return a * b;
}

- (double)multiply:(double)a by:(double)b {
  return a * b;
}

+ (void)start {
  uint64_t start, interval;

  mach_timebase_info_data_t info;
  if (mach_timebase_info(&info))
    [NSException raise:NSInternalInconsistencyException format:@"mach_timebase_info failed"];

  MethodInvocation* object = [[[MethodInvocation alloc] init] autorelease];
  id anyObject = object;
  Class anyClass = [self class];
  SEL selector = NSSelectorFromString(@"multiply:by:");

  double (^multiplyBlock)(double, double) = ^(double a, double b) {
    return a * b;
  };

  printf("method invocation\n");
  printf("===========================================================\n");

  char* formatString = "%45s %10.2f ns\n";

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    multiplyFunction(123, 456);
  interval = mach_absolute_time() - start;
  printf(formatString, "function", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    multiplyBlock(123, 456);
  interval = mach_absolute_time() - start;
  printf(formatString, "block", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [object multiply:123 by:456];
  interval = mach_absolute_time() - start;
  printf(formatString, "instance method", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [MethodInvocation multiply:123 by:456];
  interval = mach_absolute_time() - start;
  printf(formatString, "class method", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [anyObject multiply:123 by:456];
  interval = mach_absolute_time() - start;
  printf(formatString, "instance method on id", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [anyClass multiply:123 by:456];
  interval = mach_absolute_time() - start;
  printf(formatString, "class method on Class", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [object performSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "instance method performSelector:", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [MethodInvocation performSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "class method performSelector:", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [anyObject performSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "instance method performSelector: on id", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [anyClass performSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "class method performSelector: on Class", (double)interval * info.numer / info.denom / ITERATIONS);

  printf("\n");

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [object respondsToSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "instance method respondsToSelector:", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [MethodInvocation respondsToSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "class method respondsToSelector:", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [anyObject respondsToSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "instance method respondsToSelector: on id", (double)interval * info.numer / info.denom / ITERATIONS);

  start = mach_absolute_time();
  for (int i = 0; i < ITERATIONS; i++)
    [anyClass respondsToSelector:selector];
  interval = mach_absolute_time() - start;
  printf(formatString, "class method respondsToSelector: on Class", (double)interval * info.numer / info.denom / ITERATIONS);

  printf("\n");
}

@end
