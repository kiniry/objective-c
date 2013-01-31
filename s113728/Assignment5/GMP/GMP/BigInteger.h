//
//  BigInteger.h
//  GMP
//
//  Created by user on 1/26/13.
//  2013 Niclas Falck. No rights reserved.
//
//  Based on GNU MP, for more documentation see http://gmplib.org/manual/index.html#Top
//

#import <Foundation/Foundation.h>
#import <gmp.h>

@interface BigInteger : NSObject {
    mpz_t integ;
}

- (BigInteger *)init;
- (BigInteger *)initWithString:(NSString *)str;
- (BigInteger *)initWithLongInt:(NSInteger)nsint;
- (BigInteger *)initWithTwoPoweredToThe:(NSInteger)exponent;
// Precondition: initialized with init()
// Ensures value set correctly
- (void)setIntValueWithString:(NSString *)str;

- (NSInteger)getNumberOfBits;
- (NSInteger)getNumberOfDifferingBits:(BigInteger *)op2;
- (NSInteger)getNumberOfSharedLeadingBits:(BigInteger *)op2;
- (NSString *)getIntString;

// The basic arithmetic operations
- (BigInteger *)addition:(BigInteger *)op2;
- (BigInteger *)subtract:(BigInteger *)op2;
- (BigInteger *)multiply:(BigInteger *)op2;
- (BigInteger *)modulusWithBigInteger:(BigInteger *)op2;
- (NSInteger)modulusWithNSInteger:(NSInteger)anInt;
- (BigInteger *)increment;

// More arithmetic operations //
- (BigInteger *)divideByBigInteger:(BigInteger *)op2;
- (BigInteger *)divideByNSInteger:(NSInteger)nsint;
- (BigInteger *)ceil;
- (BigInteger *)sqrt;

// Number Theoretic Operations
- (BOOL)isPerfectSquare;
- (BOOL)isEven;
- (BigInteger *)nextPrime:(BigInteger *)numberOfBits;
- (BigInteger *)greatestCommonDivisorBetweenSelfAnd:(BigInteger *)op2;
+ (BigInteger *)randRangeWithBtsz:(NSInteger)bitCnt;

// Accessing Type Information

@end
