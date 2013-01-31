//
//  BigInteger.m
//  GMP
//
//  Created by user on 1/26/13.
//  Copyright (c) 2013 Niclas Falck. All rights reserved.
//
//  Based on GNU MP, for more documentation see http://gmplib.org/manual/index.html#Top
//

#import "BigInteger.h"

@implementation BigInteger


// initializes integ of type mpz_t and sets value to 0
- (BigInteger *)init{
    self = [super init];
    if (!self) return nil;
    mpz_init(integ);
    return self;
}
- (BigInteger *)initWithString:(NSString *)str{
    NSAssert([str isKindOfClass:[NSString class]], @"Precondition not met, input not NSString or integ allready initialized");
    
    self = self.init;
    const char *cString = [str UTF8String];
    NSAssert(
             mpz_set_str(integ, cString, 10 ) == 0,
             @"Postcondition failed, number not initialized correctly"
             );
    return self;
}
- (BigInteger *)initWithLongInt:(NSInteger)nsint{
    self = self.init;
    mpz_set_si(integ, nsint);
    return self;
}
- (BigInteger *)initWithTwoPoweredToThe:(NSInteger)exponent{
    NSAssert(exponent > 0, @"Precondition exponent not 0 cause 0^0=1");
    self = self.init;
    
    mpz_t base;
    mpz_init_set_si(base, 2);
    mpz_pow_ui(integ, base, exponent);
    mpz_clear(base);
    return self;
}

- (void)setIntValueWithString:(NSString *)numberAsString{
    NSAssert(integ == 0, @"precondition not satisfied, the number has not been initialized");
    const char *cString = [numberAsString UTF8String];
    // mpz_set_str (mpz_t rop, char *str, int base) ret 0 on success, -1 on fail
    NSAssert(mpz_set_str(integ, cString, 10) == 0, @"Postconditionin not satisfied, integ not initialized");
    }

- (NSInteger)getNumberOfBits{
    size_t btsz;
    btsz = mpz_sizeinbase(integ, 2);
    return (NSInteger) btsz; // simple casting from unsigned int oughta work
}
- (NSInteger)getNumberOfDifferingBits:(BigInteger *)op2{
    NSAssert(integ != 0 && op2->integ != 0, @"Precondition: both values can't be negative because of undocumented return of hamdist in gmp");
    unsigned long int numBits;
    numBits = mpz_hamdist(integ, op2->integ);
    return (NSInteger) numBits;
}
// Not implemented yet mpz_scan runs from index toward more significant bits, so maybe i need to run through a c string
- (NSInteger)getNumberOfSharedLeadingBits:(BigInteger *)op2{
    NSAssert(integ != 0 || op2->integ != 0, @"One op was 0");
    mpz_t temp;
    mpz_init(temp);
    mpz_xor(temp, integ, op2->integ);
    mp_bitcnt_t index;
    index = mpz_scan0(temp, 0);
    mpz_clear(temp);
    unsigned int long numBits;
    numBits = mpz_sizeinbase(integ, 2) - index;
    return (NSInteger) numBits;
}
- (NSString *)getIntString{
    char *cString = NULL;
    cString = mpz_get_str(cString, 10, integ);
    return [NSString stringWithUTF8String:cString];
    }

// assigns (2. param + 3. param) to 1. param
- (BigInteger *)addition:(BigInteger *)op2{
    BigInteger *returnObj = [[BigInteger alloc] init];
    mpz_add(returnObj->integ, integ, op2->integ);
    return returnObj;
}
- (BigInteger *)subtract:(BigInteger *)op2{
    NSAssert(integ && op2->integ, @"Ops don't have integ's");
    BigInteger *returnObj = [[BigInteger alloc] init];
    mpz_sub(returnObj->integ, integ, op2->integ);
    return returnObj;
}
- (BigInteger *)multiply:(BigInteger *)op2{
    NSAssert(integ && op2->integ, @"Ops don't have integ's");
    BigInteger *returnObj = [[BigInteger alloc] init];
    mpz_mul(returnObj->integ, integ, op2->integ);
    return returnObj;
}
- (BigInteger *)modulusWithBigInteger:(BigInteger *)op2{
    NSAssert(integ && op2->integ, @"Ops don't have integ's");
    BigInteger *returnObj = [[BigInteger alloc] init];
    mpz_mod(returnObj->integ, integ, op2->integ);
    return returnObj;
}
- (NSInteger)modulusWithNSInteger:(NSInteger)anInt{
    mpz_t res,num1;
    mpz_init(res);
    mpz_init_set_si(num1, anInt);
    mpz_mod(res, integ, num1);
    mpz_clear(res);
    mpz_clear(num1);
    return mpz_get_si(res);
}
// Not referentially transparent, when it alters integ based on \old???
- (BigInteger *)increment{
    NSAssert(integ, @"integ not existing");
    mpz_add_ui(integ,integ, 1);
    return self;
}

            ////////////////////////////

// Precondition integ initialized and op2->integ != 0
- (BigInteger *)divideByBigInteger:(BigInteger *)op2{
    NSAssert(integ && mpz_cmp_si(op2->integ, 0), @"Precondition failed");
    BigInteger *retObj = [[BigInteger alloc] init];
       return retObj;
}
- (BigInteger *)divideByNSInteger:(NSInteger)nsint{
    NSAssert(integ && nsint !=0, @"Precondition for divideByIntfailed");
    BigInteger *retObj = [[BigInteger alloc] init];
    return retObj;
}
- (BigInteger *)ceil{
      return self;
}
// Sets integ to the truncated integer part of sqrt
- (BigInteger *)sqrt{
    BigInteger *retObj = [[BigInteger alloc] init];
    mpz_sqrt(retObj->integ, integ);
    return retObj;
}
- (BOOL)isPerfectSquare{
    NSAssert(integ != 0, @"Precondition failed, bad integ val");
    // Returns non-zero if op is a perfect power
    unsigned int ret = mpz_perfect_power_p(integ);
    //NSLog(@"ret val in isPerfectSqr : %i", (signed) ret);
    if (ret != 0){
        return YES;
    } else return NO;
}
-(BOOL)isEven{
    const long int res = [self modulusWithNSInteger:2];
    if (res == 0) {
        return YES;
    } else {
        return NO;
    }
}	
// Uses probabilistic algorithm, so it could fuck up?!
- (BigInteger *)nextPrime:(BigInteger *)aBigNumber{
    BigInteger *retObj = [[BigInteger alloc] init];
    mpz_nextprime(retObj->integ, aBigNumber->integ);
    return retObj;
}
- (BigInteger *)greatestCommonDivisorBetweenSelfAnd:(BigInteger *)op2{
    BigInteger *retObj = [[BigInteger alloc] init];
    mpz_gcd(retObj->integ, integ, op2->integ);
    return retObj;
}
// Returns an object with random integer
+ (BigInteger *)randRangeWithBtsz:(NSInteger)bitCnt{
    NSAssert(bitCnt > 0, @"Precondition, must have nonnegative bit count");
    
    BigInteger *retObj = [[BigInteger alloc] init];
    mp_bitcnt_t bits;
    bits = bitCnt; // dunno if this will work
    gmp_randstate_t state;
    gmp_randinit_mt (state);
    
    // Okay now we try to create a cryptographically secure pseudorandom 64 bit integer seed value the way Apple recommends
    FILE *fp = fopen("/dev/random", "r");
    NSAssert(fp, @"randRange failed: couldn't open /dev/random/");
    
    uint64_t value = 0;
    int i;
    for (i=0; i<sizeof(value); i++) {
        uint8_t c = fgetc(fp);
        value |= (c << (8 * i));  // |= assigns logical OR operator
    }
    fclose(fp);
    
    // Set the random seedvalue to state
    gmp_randseed_ui(state, value);
    mpz_urandomb(retObj->integ, state, bits);
    gmp_randclear(state);
    return retObj;
}
@end
