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
@end

@implementation Random

static const long multiplier = 0x5DEECE66DL;
static const long addend = 0xBL;
static const long mask = (1L << 48) - 1;

-(id)initWithSeed:(long)seed{
    self = [super init];
    if (self)
    {
        //Init class
        _seed = seed;

    }
    return self;
}

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

-(void)nextBytes:(NSMutableData *)bytes
{
    for (int i = 0; i < [bytes length];){
        for (int rnd = [self nextInt], n = MIN((int)[bytes length]-i, 4); n-- > 0; rnd >>= 8){
            NSRange byteRange = NSMakeRange(i++, [bytes length]);
            //bytes = [bytes replaceBytesInRange:byteRange withBytes:(Byte)rnd];
        }
    }
}

-(int)nextInt
{
    
}
@end
