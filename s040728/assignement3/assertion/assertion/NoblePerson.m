//
//  NoblePerson.m
//  assignment2
//
//  Created by Magloire on 1/16/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson
@synthesize assets = _assets;
@synthesize butler = _butler;
@synthesize spouse = _spouse;

/*
 
 To make sure that self marries a  noble person, I use isKindofClass method.
 
 */
-(void) marry:(NoblePerson *)sweetHeart{
    NSAssert([sweetHeart isKindOfClass:[self class]], @"Can only marry a noble person");
    NSAssert([self canMarry:sweetHeart], @"invalid marriage");

    self.spouse = sweetHeart;
    sweetHeart.spouse = self;
    if (self.spouse == sweetHeart) {
        self.assets -= 25000;
        sweetHeart.assets -= 25000;
    }
}


@end
