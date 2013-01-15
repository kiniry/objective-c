//
//  Tim.m
//  Assignment2-2
//
//  Created by Andreas Graulund on 13/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Tim.h"

@implementation Tim

@synthesize favoriteColor, myPet;

-(Tim*) init {
	self = [super init];
	if (self) {
		myPet = @"Cat";
	}
	return self;
}

-(void) greeting {
	NSLog(@"Hi, my name is Tim!");
}

-(void) pimpify: (NSString*) keyword withWord: (NSString*) word {
	NSLog(@"%@zzle my %@zzle", keyword, word);
}

-(void) pimpify: (NSString*) keyword withNumber: (NSNumber*) number {
	NSLog(@"%@zzle my %@-izzle", keyword, number);
}

-(void) pimpify: (NSString*) keyword withInt: (int) number {
	[self pimpify: keyword withNumber: [NSNumber numberWithInt: number]];
}

@end
