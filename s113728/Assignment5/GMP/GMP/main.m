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
        
        
        // p = next_prime(randrange(2^264) + 2^512)
        p = [p nextPrime:
             [[BigInteger randRangeWithBtsz:264] addition:[[BigInteger alloc] initWithTwoPoweredToThe:512]]
              ];
        // p = next_prime(q + randrange(2^265) + 2^264)
        q = [q nextPrime:
             [p addition:[
                [BigInteger randRangeWithBtsz:265] addition: [[BigInteger alloc] initWithTwoPoweredToThe:264]
                          ]
              ]
             ];
         
        NSLog(@"p is now : %@", [p getIntString]);
        NSLog(@"q is now : %@", [q getIntString]);
        NSLog(@"p is %li bits, and q is %li bits", [p getNumberOfBits], [q getNumberOfBits]);
        // Well the attack only works if they share more than half of their leading bits
        NSLog(@"differing bits between p and q : %li", [p getNumberOfDifferingBits:q]);
        
        BigInteger *N = [[BigInteger alloc] init];
        N = [q multiply:p];
        NSLog(@"N has %li bits.", [N getNumberOfBits]);
        
        FermatFactor *factorizer = [[FermatFactor alloc] init];
        NSLog(@"uhlala : %@", [factorizer factorize:N]);
    }
    return 0;
}

