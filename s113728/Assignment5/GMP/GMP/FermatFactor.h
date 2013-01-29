//
//  FermatFactor.h
//  GMP
//
//  Created by user on 1/26/13.
//  2013 Niclas Falck. No rights reserved.
//
//  An Obj-c implementation of an attack on weak primes that factors N into p and q quickly if they share more than half of their leading bits
// Credits go to Daniel J. Bernstein, Nadia Heninger, and Tanja Lange @ http://facthacks.cr.yp.to/


#import <Foundation/Foundation.h>
#import "BigInteger.h"

@interface FermatFactor : NSObject

- (NSString *)factorize:(BigInteger *)N;

@end
