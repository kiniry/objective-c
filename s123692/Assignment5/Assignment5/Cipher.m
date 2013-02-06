//
//  Cipher.m
//  Assignment5
//
//  Created by Markus Færevaag on 05.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Cipher.h"


@interface Cipher()

@property Mode      mode;
@property CCAlgorithm algo;
@property NSString *key;
@property CCOptions opts;

@end


@implementation Cipher

@synthesize mode = _mode;
@synthesize algo = _algo;
@synthesize key  = _key;
@synthesize opts = _opts;


#pragma mark - Singleton Methods

static Cipher *singleton;

+ (id) getInstanceWithAlgorithm: (NSString *)algo
{
    @synchronized(self)
    {
        if (!singleton)
            singleton = [[Cipher alloc] initWithAlgorithm:algo];
        return singleton;
    }
}

- (id) initWithAlgorithm: (NSString *)algo
{
    self = [super init];
    if (self) {
        [self parseAlgo:algo];
    }
    return self;
}

- (void) parseAlgo: (NSString *)inputString;
{
    NSLog(@"%@", inputString);
    if ([inputString isEqualToString:@"AES"])
    {
        self.opts = kCCOptionPKCS7Padding;
        self.algo = kCCAlgorithmAES128;
    } else
    {
        NSLog(@"Unknown algorithm: %@", inputString);
        exit(1);
    }
}

- (void) initWithMode: (Mode)mode andKey: (NSString *)key
{
    singleton.mode = mode;
    singleton.key  = key;
}

- (NSData *) doFinal: (NSData *)inputData
{
    
	CCAlgorithm algo = kCCAlgorithmAES128;
	CCOptions opts = kCCOptionPKCS7Padding;
    CCCryptorStatus status = kCCSuccess;
    NSData * outputData = nil;
    
    switch (self.mode)
    {
        case ENCRYPT:
            outputData = [inputData encryptUsingAlgorithm: algo
                                                   andKey: self.key
                                               andOptions: opts
                                                 andError: &status];
            break;
        case DECRYPT:
            outputData = [inputData decryptUsingAlgorithm: self.algo
                                                   andKey: self.key
                                               andOptions: opts
                                                 andError: &status];
            break;
    }
    
    if ( status != kCCSuccess )
    {
        NSError *err = [NSError errorWithCCCryptorStatus: status];
        NSLog(@"Cipher failed: %s", [[err localizedDescription] UTF8String]);
    }
    
    if (outputData != nil)
		return outputData;
    
	return nil;
}

@end
