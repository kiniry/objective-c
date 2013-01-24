//
//  main.m
//  LevenshteinDistance
//
//  Created by Salvador Jacobi on 18/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EagerLevenshtein.h"
#import "MemoizedLevenshtein.h"

int main(int argc, const char * argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  id <LevenshteinDistance> levenshtein;
  NSUInteger distance;

  NSString* stringA = @"kitten";
  NSString* stringB = @"sitting";

  levenshtein = [EagerLevenshtein sharedInstance];
  distance = [levenshtein distanceFrom:stringA to:stringB];
  NSLog(@"The Levenshtein distance between '%@' and '%@' is %lu.", stringA, stringB, distance);

  levenshtein = [MemoizedLevenshtein sharedInstance];
  distance = [levenshtein distanceFrom:stringA to:stringB];
  NSLog(@"The Levenshtein distance between '%@' and '%@' is %lu.", stringA, stringB, distance);

  [pool drain];

  return 0;
}
