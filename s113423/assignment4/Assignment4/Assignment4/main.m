//
//  main.m
//  Assignment4
//
//  Created by Salvador Jacobi on 27/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MethodInvocation.h"
#import "StringManipulation.h"
#import "Iteration.h"

int main(int argc, const char* argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  [MethodInvocation start];
  [StringManipulation start];
  [Iteration start];

  [pool release];

  return 0;
}
