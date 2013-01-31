//
//  FermatFactor.m
//  GMP
//
//  Created by user on 1/26/13.
//  2013 Niclas Falck. No rights reserved.
//

#import "FermatFactor.h"
#import "BigInteger.h"

@implementation FermatFactor

// requires N is composite
// N = p * q = ((p+q)/2)^2-((p-q)/2)^2
- (NSString *)factorize:(BigInteger*)N{
    NSAssert([N modulusWithNSInteger:2] != 0, @"Precondition: odd numbers only");
    NSDate *start = [NSDate date]; // start timer
    
    BigInteger *a = [[BigInteger alloc] init];
    a = [[N sqrt] increment]; // sqrt truncates the int, so increment serves as ceil
    
    // Block that helps us compute a*a-b
    BigInteger* (^a_multiply_a_minus)(BigInteger*) = ^(BigInteger* n){
        return [[a multiply:a] subtract:n];
    };
    
    BigInteger *b = [[BigInteger alloc] init];
    // b = sqrt((a*a)-N)
    b = a_multiply_a_minus(N);

    // if a^2-N = b^2, then N = (a+b)(a-b)
    while ( ![b isPerfectSquare] ){
        [a increment];
        b = a_multiply_a_minus(N);
    }
    
    BigInteger *factor1 = [a addition:[b sqrt]];
    BigInteger *factor2 = [a subtract:[b sqrt]];
    
    NSString *retValue = [NSString stringWithFormat:@"p and q are : [%@ , %@]",[factor1 getIntString],[factor2 getIntString]];
    
    NSDate *finish = [NSDate date];
    double timepassed_ns = [finish timeIntervalSinceDate:start];
    NSLog(@"Time taken to factorize N = %f seconds", timepassed_ns);
    return retValue;
}
@end
