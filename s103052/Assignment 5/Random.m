/*************************************************************************
 *  File name   : Random.m
 *  Description : Random Class
 *
 *  Created on  : 25/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Random.h"

@interface Random ()

@property (readwrite, assign) long seed; // Atomic seed

@end

@implementation Random

@synthesize seed = _seed;

static const long multiplier = 0x5DEECE66DL;
static const long addend = 0xBL;
static const long mask = (1L << 48) - 1;
double nextNextGaussian;
BOOL haveNextNextGaussian = NO;

/**
 * Creates a new random number generator using a single seed (new_seed).
 */
- (id) initWithSeed:(long)new_seed 
{
	self = [super init];
    if (self)
    {
        _seed = (new_seed ^ multiplier) & mask;
        haveNextNextGaussian = NO;
    }
    return self;
}

/**
 * Private compare method for comparing and set.
 */
- (BOOL) compare:(long)seed with:(long)oldseed andSet:(long)nextseed
{
	if (seed == oldseed)
		{ self.seed = nextseed; return YES; }
	else
		return NO;
}

/**
 * Generates the next pseudorandom number.
 */
- (int) next:(int)bits
{
	long oldseed, nextseed;
	do 
	{
		oldseed = self.seed;
		nextseed = (oldseed * multiplier + addend) & mask;
	} while (![self compare:self.seed with:oldseed andSet:nextseed]);
	return (int)(nextseed >> (48 - bits));
}

/**
 * Generates random bytes and places them into a user-supplied
 * byte array. The number of random bytes produced is equal to
 * the length of the byte array.
 */	
- (void) nextBytes:(NSMutableArray*)bytes
{
	/*for (int i = 0; i < [bytes count]; )
		for(int rnd = [self nextInt], n = MIN([bytes count] - i, 4);
			n-- > 0; rnd >>= 8)
		bytes = [bytes replace
		bytes[] = (Byte)rnd;
	*/
	NSLog(@"unimplmented");
	NSAssert(NO, @"unimplmented!");
	return 0;
}

/**
 * Returns the next pseudorandom, uniformly distributed int value.
 */
- (int) nextInt
{
	return [self next:32];
}

/**
 * Returns a pseudorandom, uniformly distributed int value
 * between 0 (inclusive) and the specified value (exclusive).
 */
- (int) nextInt:(int)n
{
	if (n <= 0)
	{
		NSException* exception_PositiveN = [NSException exceptionWithName:NSInvalidArgumentException reason:@"n must be positive" userInfo:nil];
        @throw exception_PositiveN;
	}
	if ((n & -n) == n) // i.e., n is a power of 2
		return (int)((n * (long)[self next:31]) >> 32);
	
	int bits, val;
	do 
	{
		bits = [self next:31];
		val = bits % n;
	} while (bits - val + (n-1) < 0);
	return val;
}

/**
 * Returns the next pseudorandom, uniformly distributed long
 * value from this random number generator's sequence. 
 */
- (long) nextLong
{
	return ((long)[self next:32] << 32) + [self next:32];
}

/**
 * Returns the next pseudorandom, uniformly distributed
 * boolean value from this random number generator's
 * sequence. 
 */
- (BOOL) nextBoolean
{
	return ([self next:1] != 0);
}

/**
 * Returns the next pseudorandom, uniformly distributed float
 * value between 0.0 and 1.0 from this random number generator's sequence.
 */
- (float) nextFloat
{
	return [self next:24] / ((float)(1 << 24));
}

/**
 * Returns the next pseudorandom, uniformly distributed
 * double value between 0.0} and 1.0 from this random number 
 * generator's sequence.   
 */
- (double) nextDouble
{
	return (((long)[self next:26] << 27) + [self next:27]) / (double)(1L << 53);
}

/**
 * Returns the next pseudorandom, Gaussian ("normally") distributed
 * double value with mean 0.0 and standard deviation 1.0 from this 
 * random number generator's sequence.
 */
- (double) NextGaussian
{
	NSLog(@"unimplmented");
	NSAssert(NO, @"unimplmented!");
	return 0;
}

@end
