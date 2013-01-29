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

- (NSString *)factorize:(BigInteger*)N{
    NSDate *start = [NSDate date]; // start timer
    
    NSString *result;
    
    // This is the easy case
    if  (N.isEven){ 
        result = [ NSString stringWithFormat:@"[2,%@]",[[N divideByNSInteger:2] getIntString] ];
        return result;
    }
    
    BigInteger *a = [[BigInteger alloc] init];
    a = [[N sqrt] ceil];
        
    while ( (([[[a multiply:a] subtract:N] isPerfectSquare]) ? YES : NO) == NO){
        [a increment];
    }
    NSLog(@"so far so good");
    
    BigInteger *b = [[BigInteger alloc] init];
    // b = sqrt((a*a)-N)
    b = [[[[a multiply:a] subtract:N] sqrt] copyFloatToIntegIfNaturalNumber];
    
    NSString *retValue = [NSString stringWithFormat:@"p and q are : [%@,%@]",[[a subtract:b] getIntString],[[a addition:b] getIntString] ];
    
    NSDate *finish = [NSDate date];
    double timepassed_ns = [finish timeIntervalSinceDate:start];
    NSLog(@"Time taken to factorize N = %@ : %f ns",[N getIntString], timepassed_ns);
    return retValue;
}

@end
