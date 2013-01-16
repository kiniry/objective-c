//
//  SimpleProtocol.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 16/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "SimpleProtocolClass.h"

@implementation SimpleProtocolClass
// All the required elements must be implemented
@synthesize aRequiredProperty = _aRequiredProperty;
@synthesize anotherRequiredProperty = _anotherRequiredProperty;

-(void)aRequiredMethod {
    NSLog(@"The method 'aRequiredMethod' was invoked.");
}

-(void)anotherRequiredMethod {
    NSLog(@"The method 'anotherRequiredMethod' was invoked.");
}

// The optional elements; the 'aOptionalMethod' and the 'aOptionalProperty' doesn't need to be implemented.

@end
