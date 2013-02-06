//
//  NSError.h
//  Assignment5
//
//  Created by Markus Færevaag on 05.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSError (CommonCryptoErrorDomain)

+ (NSError *) errorWithCCCryptorStatus: (CCCryptorStatus) status;

@end