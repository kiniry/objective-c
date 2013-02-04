//
//  Citizen.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "CitizenDefensive.h"

@implementation CitizenDefensive




/**
 * As required a Marry command. Sets this objects spouse and the fiance's spouse
 * returns YES if marriage approved and NO if not
 */
-(bool) marry: (Citizen*) fiance {
    if (!(![fiance isEqual:self.father] && ![fiance isEqual:self.mother] && ![self.children containsObject:fiance]
         && self.sex != fiance.sex && self.spouse == nil && fiance.single && self.single)) {
        [NSException raise:@"Invalid Marriage" format:@"Invalid Marriage"];
    }
    
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
    
    if ([self.children count] > numChilds) {
        [NSException raise:@"Cannot add child" format:@"Invalid Child"];
    }
}

/**
 * Divorce method - only works if married
 */
-(void) divorce {
    if (self.spouse == nil) {
        [NSException raise:@"Divorce error" format:@"You cannot divorce somebody if you are not married"];

    }
    
    self.spouse.spouse = nil;
    self.spouse = nil;
}

@end
