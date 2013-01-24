//
//  CitizenDefensive.m
//  assignment3
//
//  Created by Joachim on 22/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "CitizenDefensive.h"

@implementation CitizenDefensive

-(void)marry:(Citizen*)citizen {
    if (![super canMarry:citizen]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Marriage invalid" userInfo:nil];
    }
    [super marry:citizen];
}

-(void)divorce {
    if(self.single) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Citizen is single" userInfo:nil];
    }
    [super divorce];
}

-(void)addChild:(Citizen *)child {
    if(!(child.mother != self && child.father != self)) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Child already added" userInfo:nil];
    }
    if(!(child != self && child != self.spouse)) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Child cannot be self or spouse" userInfo:nil];
    }
    if([child.children containsObject:self]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Child cannot be selfs parent" userInfo:nil];
    }
    [super addChild:child];
}

@end
