//
//  Citizen.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen
@synthesize firstName,
            lastName,
            sex,
            spouse,
            father,
            mother,
            children;

/**
 * Initializer method for the class.
 */
-(id) initWithName: (NSString*)firstname andLastName: (NSString*)lastname {
    self = [super init];
    
    if (self) {
        self.firstName = firstname;
        self.lastName = lastname;
    }
    
    return self;
}


-(NSString*) info {

    NSString *desc =
    [NSString stringWithFormat:@"\n Citizen: \n Name: %@ %@ \n Sex: %@ \n Spouse: %@ \n Father: %@ \n Mother: %@", self.firstName, self.lastName, self.gender,
     [NSString stringWithFormat:@"%@ %@", self.spouse.firstName, self.spouse.lastName],
     [NSString stringWithFormat:@"%@ %@", self.father.firstName, self.father.lastName],
     [NSString stringWithFormat:@"%@ %@", self.mother.firstName, self.mother.lastName]
     ];
    return desc;
}

/**
 * Return a boolean value indicating if the citizen is single or not
 */
-(bool) single {
    //If spouse exists, citizen is not single
    if (spouse != nil)
        return NO;
    
    return YES;
}


/**
 * As required a Marry command. Sets this objects spouse and the fiance's spouse
 * returns YES if marriage approved and NO if not
 */
-(bool) marry: (Citizen*) fiance {
    if (![fiance isEqual:father] && ![fiance isEqual:mother] && ![children containsObject:fiance]
            && self.sex != fiance.sex && spouse == nil && fiance.single && self.single
        ) {
        self.spouse = fiance;
        fiance.spouse = self;
        return YES;
    }
    NSLog(@"It is not possible to marry a family member or a person of same sex");
    return NO;
}


/**
 * Method for adding a child reference for this citizen
 * This method is checking if the child already has a parent of the
 * same sex as this one. if that is the case nothing is done.
 */
-(void) addChild: (Citizen*) child {
    if (children == nil) {
        children = [[NSMutableArray alloc] init];
    }
    if (self.sex == male) {
        if (child.father == nil) {
            [children addObject:child];
            child.father = self;
        }
        else {
            NSLog(@"Child already has a father");
            return;
        }
    }
    if (self.sex == female) {
        if (child.mother == nil) {
            [children addObject:child];
            child.mother = self;
        }
        else {
            NSLog(@"Child already has a mother");
            return;
        }
    }
}

/**
 * Divorce method - only works if married
 */
-(void) divorce {
    if (self.spouse != nil) {
        self.spouse.spouse = nil;
        self.spouse = nil;
    }
    else {
        NSLog(@"You cannot divorce somebody if you are not married");
    }
}

-(NSString*) gender {
    if (self.sex == male) {
        return @"Male";
    }
    else if (self.sex == female) {
        return @"Female";
    }
    return @"";
}

@end
