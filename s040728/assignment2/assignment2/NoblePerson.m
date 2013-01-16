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
    if([sweetHeart isKindOfClass:[self class]] ){
        NSLog(@"they are both noble");
        //[super marry:sweetHeart];
        if([self canMarry:sweetHeart]){
            NSLog(@"can be married");
            self.spouse = sweetHeart;
            sweetHeart.spouse = self;
        }
        // make sure the marriage is done, before removing assets
        if (self.spouse == sweetHeart) {
            self.assets -= 25000;
            sweetHeart.assets -= 25000;
        }
    }
}

@end
