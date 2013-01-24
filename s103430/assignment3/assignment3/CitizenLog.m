//
//  CitizenLog.m
//  assignment3
//
//  Created by Joachim on 22/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "CitizenLog.h"

const BOOL debug = YES;

@implementation CitizenLog

-(void)marry:(Citizen*)citizen {
    if (debug && ![super canMarry:citizen]) {
        NSLog(@"Marriage invalid");
    }
    [super marry:citizen];
    if (debug && self.spouse.spouse != self) {
        NSLog(@"Spouses are incorrect");
    }
    if(debug && !(!self.single && !citizen.single)) {
        NSLog(@"Couple is still singles");
    }
}

-(void)divorce {
    if(debug && self.single) {
        NSLog(@"Citizen is single");
    }
    [super divorce];
    if(debug && !(self.single && self.spouse == nil)) {
        NSLog(@"Citizen was not divorced");
    }
}

-(void)addChild:(Citizen *)child {
    if(debug && !(child.mother != self && child.father != self)) {
        NSLog(@"Child already added");
    }
    if(debug && !(child != self && child != self.spouse)) {
        NSLog(@"Child cannot be self or spouse");
    }
    if(debug && [child.children containsObject:self]) {
        NSLog(@"Child cannot selfs parent");
    }
    [super addChild:child];
    if(debug && ![self.children containsObject:child]) {
        NSLog(@"Child not added");
    }
    if(debug && !(child.mother == self || child.father == self)) {
        NSLog(@"Parent not set");
    }
}

@end
