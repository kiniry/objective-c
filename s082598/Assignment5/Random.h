//
//  Random.h
//  Assignment5
//
//  Created by Jonas Eriksen on 01/02/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Random : NSObject

// in addition to the setSeed method I want a getSeed so the state can be saved and the generator started reproducibly
@property (nonatomic) unsigned long seed;

// Class factory methods

+ (id) newWithSeed:(unsigned long)seed;

+ (BOOL)     randomBool;
+ (int)      randomInt;
+ (int)      randomIntBelowInt:(int)ceiling;
+ (long int) randomLong;
+ (float)    randomFloat;
+ (double)   randomDouble;
+ (double)   randomGausianDouble;

// Instance methods
- (id) init;
- (id) initWithSeed:(unsigned long)seed;

- (BOOL) randomBool;                            // pseudorandom, uniformly distributed boolean

- (int)      randomInt;                         // pseudorandom, uniformly distributed, signed int
- (int)      randomIntBelowInt:(int)ceiling;    // pseudorandom, uniformly distributed int. [0, ceiling[
- (long)     randomLong;                        // pseudorandom, uniformly distributed, signed long int

- (float)   randomFloat;                        // pseudorandom, uniformly distributed float. [0.0, 1.0[
- (double)  randomDouble;                       // pseudorandom, uniformly distributed double. [0.0, 1.0[
- (double)  randomGaussianDouble;               // pseudorandom, normal distribution with mean 0.0 and standard deviation 1.0


@end
