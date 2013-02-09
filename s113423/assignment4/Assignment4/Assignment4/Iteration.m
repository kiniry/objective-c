//
//  Iteration.m
//  Assignment4
//
//  Created by Salvador Jacobi on 27/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "Iteration.h"

#include <mach/mach_time.h>
#include <stdint.h>
#include <stdio.h>
#include <assert.h>

#define ITERATIONS 1000

#define SIZE 1000000

@implementation Iteration

+ (void)start {
  uint64_t start, interval, prevInterval;

  mach_timebase_info_data_t info;
  if (mach_timebase_info(&info))
    [NSException raise:NSInternalInconsistencyException format:@"mach_timebase_info failed"];

  NSMutableArray* mutableArray = [NSMutableArray array];
  for (int i = 0; i < ITERATIONS; i++)
    [mutableArray addObject:[NSNumber numberWithInt:i]];

  printf("fast enumeration vs. simple indexing\n");
  printf("======================================\n");

  interval = 0;
  for (int i = 0; i < ITERATIONS; i++) {
    start = mach_absolute_time();

    for (id object in mutableArray) {
      assert(object != nil); // do something with object
    }

    interval += mach_absolute_time() - start;
  }
  printf("fast enumeration: %10.2f ns\n", (double)interval * info.numer / info.denom / ITERATIONS);
  prevInterval = interval;

  interval = 0;
  for (int i = 0; i < ITERATIONS; i++) {
    start = mach_absolute_time();

    for (NSUInteger index = 0; index < [mutableArray count]; index++) {
      id object = [mutableArray objectAtIndex:index];
      assert(object != nil); // do something with object
    }

    interval += mach_absolute_time() - start;
  }
  printf("simple indexing:  %10.2f ns (%4.2f)\n", (double)interval * info.numer / info.denom / ITERATIONS, (double)interval / prevInterval);

  printf("\n");
}

@end
