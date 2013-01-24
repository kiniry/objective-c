//
//  CitizenLogging.m
//  Assignment3
//
//  Created by David Harboe on 1/24/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import "CitizenLogging.h"

#ifdef DEBUG
#endif

@implementation CitizenLogging

-(void)marry:(Citizen *)spouse
{
    if (DEBUG && (spouse == nil || !self.canMarry)) {
        NSLog(@"marry DEBUG fail: either %@ is nil or the relationship status is wrong, check -(BOOL)canMarry", spouse.name);
    }
    [super marry:spouse];
    if (DEBUG && (self.spouse != spouse || spouse.spouse != self)) {
        NSLog(@"marry DEBUG fail: the wrong are getting married");
    }
    
}

-(void)divorse
{
    if (DEBUG && (self.isSingle)) {
        NSLog(@"divorce DEBUG fail: %@ is single therefore nobody to divorce", self);
    }
    Citizen *spouse = self.spouse;
    [super divorce];
    if (DEBUG && !(self.isSingle && spouse.isSingle)) {
        NSLog(@"divorse DEBUD fail: both should be single after divorce");
    }
}

@end
