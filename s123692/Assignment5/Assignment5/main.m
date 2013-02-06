//
//  main.m
//  Assignment5
//
//  Created by Markus Færevaag on 05.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonCryptor.h"
#import "Cipher.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *key = @"my password";
        NSLog(@"Key: %@", key);
        NSString *secret = @"text to encrypt";
        NSLog(@"Key: %@", secret);

        NSData *plain = [secret dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"Plain description: %s", [[plain description] UTF8String]);
        
        Cipher *cipher = [Cipher getInstanceWithAlgorithm: @"AES"];

        [cipher initWithMode:ENCRYPT andKey:@"my key"];
        
        NSData *encrypted = [cipher doFinal: plain];
        NSLog(@"Encrypted data description:%s", [[encrypted description] UTF8String]);
        
        [cipher initWithMode:DECRYPT andKey:key];
        
        plain = [cipher doFinal:encrypted];
        NSLog(@"Cipher decrypted: %s", [[[NSString alloc] initWithData:plain
                                                             encoding:NSUTF8StringEncoding] UTF8String]);
        
    }
    return 0;
}

