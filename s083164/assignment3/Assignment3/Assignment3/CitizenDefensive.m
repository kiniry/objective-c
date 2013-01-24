//
//  CitizenDefensive.m
//  Assignment3
//
//  Created by Emil Klarskov Kristensen on 1/23/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "CitizenDefensive.h"

@implementation CitizenDefensive

-(void)marry:(Citizen *)citizen
{
    if (![self eligibleToMarry:citizen]) {
        [NSException raise:@"Not Eligible" format:@"%@ is not eligible to marry %@", self.firstName, citizen.firstName];
    }
    
    [super marry:citizen];
}

-(void) addChild:(Citizen*) child
{
    if (!self.children) self.children = [[NSMutableSet alloc] init];
    
    if ([self.children containsObject:child]) {
        [NSException raise:@"Can't add child" format:@"%@ cannot be the child of %@", child.firstName, self.firstName];
    }
    
    [super addChild:child];
}

-(void)divorce:(Citizen *)citizen
{
    if (self.spouse == nil) {
        [NSException raise:@"Can't get divorced" format:@"Precondition failure: You can't divorce when you arent married"];
    }
    
    [super divorce:citizen];
}

@end
