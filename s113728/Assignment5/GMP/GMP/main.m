//
//  main.m
//  GMP
//
//  Created by user on 1/25/13.
//  2013 Niclas Falck. No rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"
#import "FermatFactor.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // p*q = the RSA key N
        BigInteger *p = [[BigInteger alloc] init];
        BigInteger *q = [[BigInteger alloc] init];
   
        
        // p = next_prime(randrange(2^263) + 2^512)
        p = [p nextPrime:
             [[BigInteger randRangeWithBtsz:263] addition:[[BigInteger alloc] initWithTwoPoweredToThe:512]]
              ];
        // p = next_prime(p + randrange(2^263) + 2^263)
        q = [q nextPrime:
             [p addition:[
                [BigInteger randRangeWithBtsz:263] addition: [[BigInteger alloc] initWithTwoPoweredToThe:263]
                          ]
              ]
             ];
    
        NSLog(@"p is %li bits, and q is %li bits", [p getNumberOfBits], [q getNumberOfBits]);
        NSLog(@"Number of differing bits between p and q : %li", [p getNumberOfDifferingBits:q]);
         
        BigInteger *N = [[BigInteger alloc] init];
        N = [p multiply:q];
        NSLog(@"N has %li bits.", [N getNumberOfBits]);
        
        FermatFactor *factorizer = [[FermatFactor alloc] init];
        NSLog(@"The factors %@", [factorizer factorize:N]);
    }
    return 0;
}

