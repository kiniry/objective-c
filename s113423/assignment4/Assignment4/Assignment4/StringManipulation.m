//
//  StringManipulation.m
//  Assignment4
//
//  Created by Salvador Jacobi on 27/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "StringManipulation.h"

#include <mach/mach_time.h>
#include <stdint.h>
#include <stdio.h>

#define ITERATIONS 1000

#define LENGTH_START 100
#define LENGTH_MAX 1000000

@implementation StringManipulation

+ (void)start {
  uint64_t start, interval;

  mach_timebase_info_data_t info;
  if (mach_timebase_info(&info))
    [NSException raise:NSInternalInconsistencyException format:@"mach_timebase_info failed"];

  NSMutableString* mutableString = [NSMutableString string];
  uint64_t prevIntervalImmutable = UINT64_MAX;
  uint64_t prevIntervalMutable = UINT64_MAX;

  printf("stringByAppendingString vs. appendString\n");
  printf("====================================================================================\n");

  printf("| Length | `stringByAppendingString:` | ratio | `appendString:` | ratio |\n");
  printf("| ------:| --------------------------:| -----:| ---------------:| -----:|\n");

  for (int n = LENGTH_START; n <= LENGTH_MAX; n *= 2) {
    printf("| %6d |", n);

    while ([mutableString length] < n)
      [mutableString appendString:@"A"];
    NSString* string = [mutableString copy];

    interval = 0;
    for (int i = 0; i < ITERATIONS; i++) {
      start = mach_absolute_time();
      [string stringByAppendingString:@"Whatever"];
      interval += mach_absolute_time() - start;
    }
    printf( "%24.2f ns | %05.2f |", (double)interval * info.numer / info.denom / ITERATIONS, (double)interval / prevIntervalImmutable);
    prevIntervalImmutable = interval;

    interval = 0;
    for (int i = 0; i < ITERATIONS; i++) {
      [mutableString setString:string];
      start = mach_absolute_time();
      [mutableString appendString:@"Whatever"];
      interval += mach_absolute_time() - start;
    }
    printf(" %12.2f ns | %05.2f |\n", (double)interval * info.numer / info.denom / ITERATIONS, (double)interval / prevIntervalMutable);
    prevIntervalMutable = interval;

    [string release];
  }

  printf("\n");
}

@end
