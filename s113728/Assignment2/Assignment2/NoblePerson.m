//
//  NoblePerson.m
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

@synthesize butler = _butler;
@synthesize assets = _assets;

// Added help method to check for nobility. 
- (BOOL)isNoblePerson:(Citizen *)person{
    if (self.class == [person class]){
        return YES;
    } else {
        NSLog(@"Cannot marry a commoner");
        return NO;
    }
}

- (BOOL)impedimentToMarriage:(Citizen *)aSpouse{
    if (self.single) {
        if (aSpouse != self
            // Method overridden becauses of nobility check, to keep the domains seperated the marry method stays the same
            && [self isNoblePerson:aSpouse]
            && ![self.children containsObject:aSpouse]
            && ![self.parents containsObject:aSpouse]) {
            NSLog(@"Ready to marry a noble person");
            return YES;
        }
    }
    else return NO;
}


@end
