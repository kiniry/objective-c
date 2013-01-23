//
//  Foo.m
//  Ass4Stack
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Foo.h"

@implementation Foo

-(void) recursion {
	static int i;
	
	NSLog(@"%d", i++);
	[self recursion];
}

@end
