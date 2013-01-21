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
        spouse = spouse;
}

- (void) setMother:(Citizen *)mother {
    if(!self) {
        mother = mother; // what is wrong?
    }
}

- (void) setFather:(Citizen *)father {
    if(!self && father != _mother) { // why can't I do this?
        father = father;
    }
}

- (void) setCan_marry:(BOOL *)can_marry {
        if(!self && self.sex != _spouse.sex && _spouse != _mother && _spouse != _father) {
        
        }
}

- (void) setMarry:(NoblePerson *)marry {
    if(true) {
        _marry = marry; // don't understand what to do here.
    }
}


@end
