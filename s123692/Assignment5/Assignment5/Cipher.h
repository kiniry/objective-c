//
//  Cipher.h
//  Assignment5
//
//  Created by Markus Færevaag on 05.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonCryptor.h"


typedef enum {
    ENCRYPT,
    DECRYPT
} Mode;


@interface Cipher : NSObject

+ (id) getInstanceWithAlgorithm: (NSString *)algo;

- (void) initWithMode: (Mode)mode andKey: (NSString *)key;

- (NSData *) doFinal: (NSData *)inputData;

@end
