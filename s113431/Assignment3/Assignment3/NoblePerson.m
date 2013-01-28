//
//  NoblePerson.m
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/13/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson 

- (void) setSpouse:(NoblePerson *)spouse {
        super.spouse = spouse;
}



- (void) marry:(NoblePerson *)sweetheart {
    NSAssert(self.butler && sweetheart.butler, @"marry precondition failed");
        self.spouse = sweetheart;
        sweetheart.spouse = self;
}

@end
