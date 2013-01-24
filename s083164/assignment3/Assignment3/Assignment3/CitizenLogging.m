//
//  CitizenLogging.m
//  Assignment3
//
//  Created by Emil Klarskov Kristensen on 1/23/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "CitizenLogging.h"

static bool debug = NO;

@implementation CitizenLogging

+(void)setDebug:(bool)val
{
    debug = val;
}

-(void)marry:(Citizen *)citizen
{
    if (debug && (citizen == nil || ![self eligibleToMarry:citizen])) {
        NSLog(@"Precondition failure: %@ is not eligible to marry %@", self.firstName, citizen.firstName);
    }
    
    [super marry:citizen];
    
    if (debug && (self.spouse != citizen || citizen.spouse != self)) {
        NSLog(@"Postcondition failure");
    }
}

-(void) addChild:(Citizen*) child
{
    if (!self.children) self.children = [[NSMutableSet alloc] init];
    
    if (debug && ([self.children containsObject:child])) {
        NSLog(@"Precondition failure: Cant add an aldready existing child");
    }
    
    NSInteger initNumberOfChiildren = [self.children count];
    
    [super addChild:child];
    
    if (debug && ([self.children count] <= initNumberOfChiildren)) {
        NSLog(@"Postcondition failure: No child was added");
    }
}

-(void)divorce:(Citizen *)citizen
{
    if (debug && (self.spouse == nil)) {
        NSLog(@"Precondition failure: You can't divorce when you arent married");
    }
    
    [super divorce:citizen];
    
    if (debug && (self.spouse != nil)) {
        NSLog(@"Postcondition failure");
    }
}
@end
