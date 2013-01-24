//
//  main.m
//  Ass4Stack
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    Foo *foo = [[Foo alloc] init];
	    
		[foo recursion];
	}
    return 0;
}

