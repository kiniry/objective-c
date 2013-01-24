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


- (void) setMarry:(NoblePerson *)sweetheart {
    if(self.spouse != nil && (self.butler || sweetheart.butler)) {
        self.spouse = sweetheart;
        sweetheart.spouse = self;
    }
}


@end
