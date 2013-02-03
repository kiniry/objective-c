//
//  Random.m
//  assignment5
//
//  Created by Joachim on 03/02/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "Random.h"
#import <math.h>

static const long MULTIPLIER = 0x5DEECE66DL;
static const long ADDEND = 0xBL;
static const long MASK = (1L << 48) - 1;

@interface Random()

@property long seed;
@property long seedUniquifier;
@property double nextNextGaussian;
@property BOOL haveNextNextGaussian;

@end

@implementation Random

-(BOOL)compareSeed:(long)seed withSeed:(long)oldseed andSetSeed:(long)newseed {
    if(seed == oldseed) {
        self.seed = newseed;
        return YES;
    }
    return NO;
}

+(long)seedUniquifier {
    long next;
    for(;;) {
        long current = self.seedUniquifier;
        next = current * 181783497276652981L;
    }
    return next;
}

-(id)init {
    _seedUniquifier = 8672522807148012L;
    _haveNextNextGaussian = NO;
    long seedUniquifier = [self seedUniquifier];
    _seedUniquifier = seedUniquifier;
    NSTimeInterval totalTime = [[NSDate date] timeIntervalSince1970];
    long systemNanoTime = totalTime*1000000;
    // create seed automatically
    long seed = _seedUniquifier ^ systemNanoTime;
    return [self initWithSeed:seed];
}

-(id)initWithSeed:(long)seed {
    self = [super init];
    if(self) {
        _seed = (seed^MULTIPLIER)&MASK;
        _haveNextNextGaussian = NO;
    }
    return self;
}

-(int)next:(int)bits {
    long oldseed, nextseed;
    do {
        oldseed = self.seed;
        nextseed = (oldseed*MULTIPLIER+ADDEND)&MASK;
    } while (![self compareSeed:self.seed withSeed:oldseed andSetSeed:nextseed]);
    return (int)(nextseed >> (48 - bits));
}

-(void)nextBytes:(NSMutableData*) bytes{
    //size of BYTE is 8. size of int is 32
    //make an indexable array for the data
    uint8_t bytesArr[bytes.length];
    [bytes getBytes:&bytesArr];
    for(int i = 0, len = bytes.length; i < len;) {
        for(int rnd = [self nextInt], n = MIN(len - i, 32/8); n-- > 0; rnd >>= 8) {
            bytesArr[i++] = (Byte)rnd;
        }
    }
}

-(int)nextInt {
    return [self next:32];
}

-(int)nextIntWithMaxVal:(int)max {
    if(max <= 0) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"max must be positive" userInfo:nil];
    }
    
    if((max & -max) == max) {
        return (int)(max * (long)[self next:31]) >> 31;
    }
    
    int bits, val;
    do {
        bits = [self next:31];
        val = bits % max;
    } while (bits - val + (max-1) < 0);
    return val;
}

-(long)nextLong {
    return (((long)[self next:32]) << 32) + [self next:32];
}

-(BOOL)nextBoolean {
    return [self next:1] != 0;
}

-(float)nextFloat {
    return [self next:24] / ((float)(1 << 24));
}

-(double)nextDouble {
    return ((((long)[self next:26]) << 27) + [self next:27])/(double)(1L << 53);
}

-(double)nextGaussian {
    NSAssert(false,@"Not implemented");
    return 0;
}

@end
