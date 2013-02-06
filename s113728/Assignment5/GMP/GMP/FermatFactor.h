//
//  FermatFactor.h
//  GMP
//
//  Created by user on 1/26/13.
//  2013 Niclas Falck. No rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"

@interface FermatFactor : NSObject

- (NSString *)factorize:(BigInteger *)N;

@end
