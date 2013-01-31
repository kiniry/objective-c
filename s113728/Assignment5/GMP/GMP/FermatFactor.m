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
    NSDate *start = [NSDate date]; // start timer
    
    NSString *result;
    
    NSLog(@"is N : %@ even? : %@", [N getIntString], [N isEven] ? @"true" : @"false");
    
    // This is the easy case
    if  (N.isEven){ 
        result = [ NSString stringWithFormat:@"[2,%@]",[[N divideByNSInteger:2] getIntString] ];
        return result;
    }
    
    // Requirement for calling help method
    BigInteger *a = [[BigInteger alloc] init];
    a = [[N sqrt] increment]; // sqrt truncates the int, so increment serves as ceil
    
    // Block that helps us compute a*a-b, it's referentially transparent, so it ought to reduce the performace penalty that we had when calling same methods in the while loop below
    BigInteger* (^a_multiply_a_minus)(BigInteger*) = ^(BigInteger* n){
        return [[a multiply:a] subtract:n];
    };
    
    // if a^2-N = b^2, then N = (a+b)(a-b)
    while ( ![a_multiply_a_minus(N) isPerfectSquare] ){
        [a increment];
    }
    
    BigInteger *b = [[BigInteger alloc] init];
    // b = sqrt((a*a)-N)
    b = [a_multiply_a_minus(N) sqrt];
    
    
    NSString *retValue = [NSString stringWithFormat:@"p and q are : [%@,%@]",[[a subtract:b] getIntString],[[a addition:b] getIntString] ];
    
    NSDate *finish = [NSDate date];
    double timepassed_ns = [finish timeIntervalSinceDate:start];
    NSLog(@"Time taken to factorize N = %@ : %f ns",[N getIntString], timepassed_ns);
    return retValue;
}

@end
