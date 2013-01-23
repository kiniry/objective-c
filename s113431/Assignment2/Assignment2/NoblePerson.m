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

- (void) setCan_marry:(BOOL *)can_marry {
        if(!self && self.sex != spouse.sex && spouse != mother && spouse != father) {
        
        }
}

- (void) setMarry:(NoblePerson *)marry {
    if(true) {
        self.marry = marry; // don't understand what to do here.
    }
}


@end
