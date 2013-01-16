//
//  Tom.m
//  Assignment2-2
//
//  Created by Andreas Graulund on 13/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Tom.h"

@implementation Tom

@synthesize timsColor;

-(NSString *) fullName {
	return @"Tom Fulton";
}

-(void) greeting {
	NSLog(@"Hello, you're talking to Tom!");
}

@end
