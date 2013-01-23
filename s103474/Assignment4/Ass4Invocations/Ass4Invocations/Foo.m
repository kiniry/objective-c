//
//  Foo.m
//  Ass4Invocations
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Foo.h"

@implementation Foo

@synthesize test = _test;

-(void) method {
	_test = !_test; // To have something to do.
}

+(void) bar {
	static int i;
	i = !i; // Likewise.
}

@end
