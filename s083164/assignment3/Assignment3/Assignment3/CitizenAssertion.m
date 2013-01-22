//
//  CitizenAssertion.m
//  Assignment3
//
//  Created by Emil Klarskov Kristensen on 1/22/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "CitizenAssertion.h"

@implementation CitizenAssertion

-(void)marry:(Citizen *)citizen
{
    NSAssert([super marry:citizen], @"Can't marry!");
    NSAssert(self.spouse == citizen && citizen.spouse == self, @"Postcondition failure");
}

-(void) addChild:(Citizen*) child
{
    if (!self.children) self.children = [[NSMutableSet alloc] init];
    
    NSInteger initNumberOfChiildren = [self.children count];
    
    [super addChild:child];
    
    NSAssert([self.children count] > initNumberOfChiildren, @"addChild postcondition failure");
}

@end
