//
//  NSData+CommonCryptor.m
//  Assignment5
//
//  Created by Markus Færevaag on 05.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "CommonCryptor.h"


@implementation NSData (CommonCryptor)

- (NSData *) AES256EncryptedDataUsingKey: (id) key error: (NSError **) error
{
	CCCryptorStatus status = kCCSuccess;
	NSData * result = [self encryptUsingAlgorithm: kCCAlgorithmAES128
													andKey: key
                                                andOptions: kCCOptionPKCS7Padding
												  andError: &status];
    
	if ( result != nil )
		return ( result );
    
	if ( error != NULL )
		*error = [NSError errorWithCCCryptorStatus: status];
    
	return ( nil );
}

- (NSData *) decryptedAES256DataUsingKey: (id) key error: (NSError **) error
{
	CCCryptorStatus status = kCCSuccess;
	NSData * result = [self decryptUsingAlgorithm: kCCAlgorithmAES128
													andKey: key
                                                andOptions: kCCOptionPKCS7Padding
												  andError: &status];
    
	if ( result != nil )
		return ( result );
    
	if ( error != NULL )
		*error = [NSError errorWithCCCryptorStatus: status];
    
	return ( nil );
}

@end

//static void FixKeyLengths(CCAlgorithm algorithm, NSMutableData * keyData)
//{
//	NSUInteger keyLength = [keyData length];
//	switch (algorithm)
//	{
//		case kCCAlgorithmAES128:
//		{
//			if ( keyLength < 16 )
//				[keyData setLength: 16];
//			else if ( keyLength < 24 )
//				[keyData setLength: 24];
//			else
//                [keyData setLength: 32];
//            
//			break;
//		}
//            
//		case kCCAlgorithmDES:
//		{
//			[keyData setLength: 8];
//			break;
//		}
//            
//		case kCCAlgorithm3DES:
//		{
//			[keyData setLength: 24];
//			break;
//		}
//            
//		case kCCAlgorithmCAST:
//		{
//			if ( keyLength < 5 )
//				[keyData setLength: 5];
//			else if ( keyLength > 16 )
//				[keyData setLength: 16];
//            
//			break;
//		}
//            
//		case kCCAlgorithmRC4:
//		{
//			if ( keyLength > 512 )
//				[keyData setLength: 512];
//			break;
//		}
//            
//		default:
//			break;
//	}
//}

@implementation NSData (LowLevelCommonCryptor)

//
// Created by Jim Dovey on 31/8/2008
// (Found at: github.com/AlanQuatermain/aqtoolkit/tree/master/CommonCrypto)
//
- (NSData *) _runCryptor: (CCCryptorRef) cryptor result: (CCCryptorStatus *) status
{
	size_t bufsize = CCCryptorGetOutputLength( cryptor, (size_t)[self length], true );
	void * buf = malloc( bufsize );
	size_t bufused = 0;
    size_t bytesTotal = 0;
	*status = CCCryptorUpdate( cryptor, [self bytes], (size_t)[self length],
							  buf, bufsize, &bufused );
	if ( *status != kCCSuccess )
	{
		free( buf );
		return ( nil );
	}
    
    bytesTotal += bufused;
    
	*status = CCCryptorFinal( cryptor, buf + bufused, bufsize - bufused, &bufused );
	if ( *status != kCCSuccess )
	{
		free( buf );
		return ( nil );
	}
    
    bytesTotal += bufused;
    
	return ( [NSData dataWithBytesNoCopy: buf length: bytesTotal] );
}

- (NSData *) dataEncryptedUsingAlgorithm: (CCAlgorithm)algorithm
									 key: (NSString *)key
								   error: (CCCryptorStatus *)error
{
	CCCryptorRef cryptor = NULL;
	CCCryptorStatus status = kCCSuccess;
    
	NSMutableData * keyData;
    
    keyData = [[key dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    
	// ensure correct lengths for key
//	FixKeyLengths(algorithm, keyData);
    
	status = CCCryptorCreate(kCCEncrypt,
                             algorithm,
                             0, // Options not implemented
                             [keyData bytes],
                             [keyData length],
                             nil, // Initiation vector not implemented
                             &cryptor);
    
	if ( status != kCCSuccess )
	{
		if ( error != NULL )
			*error = status;
		return ( nil );
	}
    
	NSData * result = [self _runCryptor: cryptor result: &status];
    
	if ((result == nil) && (error != NULL))
		*error = status;
    
	CCCryptorRelease(cryptor);
    
	return result;
}

- (NSData *) decryptedDataUsingAlgorithm: (CCAlgorithm)algorithm
									 key: (NSString *)key
								   error: (CCCryptorStatus *)error
{
	CCCryptorRef cryptor = NULL;
	CCCryptorStatus status = kCCSuccess;
    
	NSMutableData *keyData = [[key dataUsingEncoding: NSUTF8StringEncoding] mutableCopy];
    
	// ensure correct lengths for key
//	FixKeyLengths(algorithm, keyData);
    
	status = CCCryptorCreate( kCCDecrypt,
                             algorithm,
                             0, // Options not implemented
                             [keyData bytes],
                             [keyData length],
                             nil, // Initiation vector not implemented
                             &cryptor);
    
	if ( status != kCCSuccess )
	{
		if ( error != NULL )
			*error = status;
		return ( nil );
	}
    
	NSData * result = [self _runCryptor: cryptor result: &status];
	if ( (result == nil) && (error != NULL) )
		*error = status;
    
	CCCryptorRelease( cryptor );
    
	return result;
}

@end