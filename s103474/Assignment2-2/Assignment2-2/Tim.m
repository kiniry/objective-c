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

@end
