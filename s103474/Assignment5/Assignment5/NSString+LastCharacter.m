//
//  NSString+LastCharacter.m
//  Assignment5
//
//  Created by Andreas Graulund on 26/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "NSString+LastCharacter.h"

@implementation NSString (LastCharacter)

-(NSString *)lastCharacter {
	if ([self length] <= 0) {
		return @"";
	}
	return [self substringFromIndex:[self length] - 1];
}

@end
