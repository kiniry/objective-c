//
//  Citizen.m
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/11/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (void) setMother:(Citizen *)mother {
    if(!self) {
        _mother = mother;
    }
}

- (void) setFather:(Citizen *)father {
    if(!self && _father != _mother) {
        _father = father;
    }
}

- (void) setCan_marry:(BOOL *)can_marry {
    if(!self && self.sex != _spouse.sex && _spouse != _mother && _spouse != _father) {
        BOOL can_marry = YES;
        _can_marry = &can_marry;
        
    }
}

- (void) setMarry:(Citizen *)marry {
    if(_can_marry) {
        
    }
}

@end
