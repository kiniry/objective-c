//
//  Citizen.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "CitizenAssert.h"

@implementation CitizenAssert




/**
 * As required a Marry command. Sets this objects spouse and the fiance's spouse
 * returns YES if marriage approved and NO if not
 */
-(bool) marry: (Citizen*) fiance {
    NSAssert((![fiance isEqual:self.father] && ![fiance isEqual:self.mother] && ![self.children containsObject:fiance]
             && self.sex != fiance.sex && self.spouse == nil && fiance.single && self.single), @"Invalid marriage");
    
    self.spouse = fiance;
    fiance.spouse = self;
    return YES;
}


/**
 * Method for adding a child reference for this citizen
 * This method is checking if the child already has a parent of the
 * same sex as this one. if that is the case nothing is done.
 */
-(void) addChild: (Citizen*) child {
    if (self.children == nil) {
        self.children = [[NSMutableArray alloc] init];
    }
    NSInteger numChilds = [self.children count];
    
    if (child != nil && child != self) {
        if (self.sex == male) {
            if (child.father == nil) {
                [self.children addObject:child];
                child.father = self;
            }
        }
        if (self.sex == female) {
            if (child.mother == nil) {
                [self.children addObject:child];
                child.mother = self;
            }
        }
    }
    NSAssert([self.children count] > numChilds, @"Invalid Child");
}

/**
 * Divorce method - only works if married
 */
-(void) divorce {
    NSAssert(self.spouse != nil, @"You cannot divorce somebody if you are not married");
    self.spouse.spouse = nil;
    self.spouse = nil;
}

@end
