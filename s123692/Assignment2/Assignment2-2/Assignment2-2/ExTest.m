//
//  ExTest.m
//  Assignment2-2
//
//  Created by Markus Færevaag on 16.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "ExTest.h"

@implementation ExTest

+(void) throwExceptionWithName:(NSString *)name andMsg: (NSString *)msg
{
    @try {
        @throw([NSException exceptionWithName:name
                                       reason:msg
                                     userInfo:nil]);
    }
    @catch (NSException *e) {
        NSLog(@"Exception caught:");
        NSLog(@"> Name: %@", e.name);
        NSLog(@"> Reason: %@", e.reason);
    }
    @finally {
        NSLog(@"Exception finally");
    }
}

@end
