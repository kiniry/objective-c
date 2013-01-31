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
        // p = next_prime(p + randrange(2^265) + 2^264)
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
         
        // So far it works with these manual examples, but not with the random generated p and q
        BigInteger *N = [[BigInteger alloc] initWithString:@"115792089237316195448679392282006640413199890130332179010243714077028592474181"];
        
        NSLog(@"N has %li bits.", [N getNumberOfBits]);
        NSLog(@"N squared is : %@", [[N sqrt] getIntString]);
        
        FermatFactor *factorizer = [[FermatFactor alloc] init];
        NSLog(@"uhlala : %@", [factorizer factorize:N]);
    }
    return 0;
}

