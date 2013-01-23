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
    NSAssert([super eligibleToMarry:citizen], @"Precondition failure: Not eligible to get married");
    
    [super marry:citizen];
    
    NSAssert(self.spouse == citizen && citizen.spouse == self, @"Postcondition failure");
}

-(void) addChild:(Citizen*) child
{
    NSAssert(![self.children containsObject:child], @"Precondition failure: Cant add an aldready existing child");
    
    if (!self.children) self.children = [[NSMutableSet alloc] init];
    
    NSInteger initNumberOfChiildren = [self.children count];
    
    [super addChild:child];
    
    NSAssert([self.children count] > initNumberOfChiildren, @"Postcondition failure: No child was added");
}

-(void)divorce:(Citizen *)citizen
{
    NSAssert(self.spouse != nil, @"Precondition failure: You can't divorce when you arent married");
    
    [super divorce:citizen];
    
    NSAssert(self.spouse == nil, @"Postcondition failure");
}

@end
