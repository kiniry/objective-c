//
//  Citizen.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen
@synthesize firstName, lastName, sex, spouse;

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
    [NSString stringWithFormat:@"Citizen: %@ %@", self.firstName, self.lastName];
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

@end
