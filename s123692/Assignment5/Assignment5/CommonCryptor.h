//
//  NSData+CommonCryptor.h
//  Assignment5
//
//  Created by Markus Færevaag on 05.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "CommonCryptoErrorDomain.h"

@interface NSData (CommonCryptor)

- (NSData *) AES256EncryptedDataUsingKey: (id)key error: (NSError **)error;
- (NSData *) decryptedAES256DataUsingKey: (id)key error: (NSError **)error;

@end

@interface NSData (LowLevelCommonCryptor)

- (NSData *) encryptUsingAlgorithm: (CCAlgorithm)algorithm
                            andKey: (NSString *)key
                        andOptions: (CCOptions)options
                          andError: (CCCryptorStatus *)error;

- (NSData *) decryptUsingAlgorithm: (CCAlgorithm)algorithm
                            andKey: (NSString *)key
                        andOptions: (CCOptions)options
                          andError: (CCCryptorStatus *)error;
@end