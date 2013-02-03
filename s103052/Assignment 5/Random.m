/*************************************************************************
 *  File name   : Random.m
 *  Description : Random Class
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Random.h"

@interface Random ()

@property (readwrite, assign) long seed; 			// AtomicLong seed
@property (readwrite, assign) long seedUniquifier; 	// AtomicLong seedUniquifier

@end

@implementation Random

@synthesize seed = _seed;
@synthesize seedUniquifier = _seedUniquifier;

static const long multiplier = 0x5DEECE66DL;
static const long addend = 0xBL;
static const long mask = (1L << 48) - 1;
static double nextNextGaussian = 0;
static BOOL haveNextNextGaussian = NO;

/**
 * Creates a new random number generator. This constructor sets
 * the seed of the random number generator to a value very likely
 * to be distinct from any other invocation of this constructor.
 */
- (id) init
{
    long seedUniquifierFromMethod = [self seedUniquifier];
    NSTimeInterval timeInMiliseconds = [[NSDate date] timeIntervalSince1970];
    long systemNanoTime = timeInMiliseconds * 1000000;
    long seed = seedUniquifierFromMethod ^ systemNanoTime;
    return [self initWithSeed:seed];
}

+ (long) seedUniquifier
{
    long next;
    for (;;)
	{
        long current = self.seedUniquifier;
        next = current * 181783497276652981L;
    }
    return next;
}

/**
 * Creates a new random number generator using a single seed (new_seed).
 */
- (id) initWithSeed:(long)seed 
{
	self = [super init];
    if (self)
    {
        _seed = (seed ^ multiplier) & mask;
        haveNextNextGaussian = NO;
    }
    return self;
}

/**
 * Private compare method for comparing and set.
 */
- (BOOL) compareAndSet:(long)seed with:(long)oldseed andSet:(long)nextseed
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
	} while (![self compareAndSet:self.seed with:oldseed andSet:nextseed]);
	return (int)(nextseed >> (48 - bits));
}

/**
 * Generates random bytes and places them into a user-supplied
 * byte array. The number of random bytes produced is equal to
 * the length of the byte array.
 */	
- (void) nextBytes:(NSMutableArray*)bytes
{
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
	return (((long)([self next:26]) << 27) + [self next:27]) / (double)(1L << 53);
}

/**
 * Returns the next pseudorandom, Gaussian ("normally") distributed
 * double value with mean 0.0 and standard deviation 1.0 from this 
 * random number generator's sequence.
 */
- (double) nextGaussian
{
	if (haveNextNextGaussian)
	{
        haveNextNextGaussian = NO;
        return nextNextGaussian;
    } 
	else 
	{
		double v1, v2, s;
        do 
		{
            v1 = 2 * [self nextDouble] - 1;
            v2 = 2 * [self nextDouble] - 1;
            s = v1 * v1 + v2 * v2;
        } while (s >= 1 || s == 0);
        double multiplier = sqrt(-2 * log(s) / s);
        nextNextGaussian = v2 * multiplier;
        haveNextNextGaussian = YES;
        return v1 * multiplier;
    }
}

@end
