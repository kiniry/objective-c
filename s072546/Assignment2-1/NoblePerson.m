//
//  NoblePerson.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson
@synthesize butler, assets;


/**
 * Override the Citizen marry method.
 * Constraints are that there must exist a butler and each nobleperson
 * must share his assets
 */
-(bool)marry:(NoblePerson*) fiance {
    

    if (self.butler == nil && fiance.butler == nil) {
        NSLog(@"No butler available, how would you live then?");
        return NO;
    }
    
    //Spread the wealth
    return [super marry:fiance];
}

@end
