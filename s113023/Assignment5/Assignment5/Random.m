//
//  Random.m
//  Assignment5
//
//  Created by Andreas Haure on 23/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "Random.h"

@interface Random()
@property (atomic) long seed;
@property (atomic) long seedUniquifier;
@end

@implementation Random

//MOVE SOME BELOW TO PROPERTIES, THIS IS JUST TO TEST
static const long multiplier = 0x5DEECE66DL;
static const long addend = 0xBL;
static const long mask = (1L << 48) - 1;
static double nextNextGaussian;
static BOOL haveNextNextGaussian = NO;

-(BOOL)compare:(long)seed with:(long)oldseed andSet:(long)nextseed
{
    if (seed == oldseed)
    {
        self.seed = nextseed;
        return YES;
    } else
    {
        return NO;
    }
}

// Create next random seed
+(long)seedUniquifier
{
    long next;
    for (;;){
        long current = self.seedUniquifier;
        next = current * 181783497276652981L;
    }
    return next;
}

// Init with random seed
-(id)init{
    long seedUniquifierFromMethod = [self seedUniquifier];
    NSTimeInterval timeInMiliseconds = [[NSDate date] timeIntervalSince1970];
    long systemNanoTime = timeInMiliseconds*1000000;
    long seed = seedUniquifierFromMethod ^ systemNanoTime;
    return [self initWithSeed:seed];
}

// Init with specific seed
-(id)initWithSeed:(long)seed{
    self = [super init];
    if (self)
    {
        //Init object
        _seed = (seed ^ multiplier) & mask;
        haveNextNextGaussian = NO;
    }
    return self;
}

// Takes random bits as input. Output next pseudorandom value.
-(int)next:(int)bits
{
    long oldseed, nextseed;
    do
    {
        oldseed = self.seed;
        nextseed = (oldseed * multiplier + addend) & mask;
    }
    while (![self compare:self.seed with:oldseed andSet:nextseed]);
    return (int)(nextseed >> (48 - bits));
}

-(void)nextBytes:(NSMutableData*)bytes
{
    NSLog(@"Not implemented yet");
}

//Return next pseudorandom integer
-(int)nextInt
{
    return [self next:32];
}

//Return next pseudorandom integer between 0 and the input integer n
-(int)nextInt:(int) n
{
    if (n <= 0){
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"n must be positive" userInfo:nil];
    }
    if ((n & -n) == n){
        return (int)((n * (long)[self next:31]) >> 31);
    }
    
    int bits, val;
    do {
        bits = [self next:31];
        val = bits  %n;
    } while (bits - val + (n-1) < 0);
    return val;
}

//Return next pseudorandom long value
-(long)nextLong
{
    return ((long)([self next:32]) << 32) + [self next:32];
}

//Return next pseudorandom boolean value
-(BOOL)nextBoolean
{
    return [self next:1]  != 0;
}

//Return next pseudorandom float value
-(float)nextFloat
{
    return [self next:24]/((float)(1<<24));
}

//Return next pseudorandom double value
-(double)nextDouble
{
    return (((long)([self next:26]) << 27) + [self next:27])/ (double)(1L << 53);
}

-(double)nextGaussian
{
    if(haveNextNextGaussian){
        haveNextNextGaussian = NO;
        return nextNextGaussian;
    } else {
        double v1,v2,s;
        do {
            v1 = 2 * [self nextDouble] - 1;
            v2 = 2 * [self nextDouble] - 1;
            s = v1 * v1 + v2 * v2;
        } while (s >= 1 || s == 0);
        double multiplier = sqrt(-2*log(s)/s);
        nextNextGaussian = v2 * multiplier;
        haveNextNextGaussian = YES;
        return v1 * multiplier;
    }
}

@end
