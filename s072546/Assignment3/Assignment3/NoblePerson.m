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
    if (![fiance isKindOfClass:[NoblePerson class]]) {
        NSLog(@"NoblePerson can only marry other Nobles");
        return false;
    }

    if (self.butler == nil && fiance.butler == nil) {
        NSLog(@"No butler available, how would you live then?");
        return NO;
    }

    //Spread the wealth
    NSNumber *total_assets = [NSNumber numberWithInt:([fiance.assets intValue] + [self.assets intValue])];
    if ([total_assets integerValue] < 50000) {
        NSLog(@"Not enough money available.");
        return NO;
    }
    //Check previous conditions before moving money around and reassigning butler
    if ([super marry:fiance]) {
        self.assets = [NSNumber numberWithInt:[total_assets integerValue]/2];
        fiance.assets = [NSNumber numberWithInt:[total_assets integerValue]/2];
        
        if (self.butler == nil)
            self.butler = fiance.butler;
        
        if (fiance.butler == nil)
            fiance.butler = self.butler;
        
        return YES;
    }
    
    return NO;
}


-(NSString*) info {
    
    NSString *desc =
    [NSString stringWithFormat:@"\n NoblePerson: \n Name: %@ %@ \n Sex: %@ \n Spouse: %@ \n Father: %@ \n Mother: %@", self.firstName, self.lastName, self.gender,
     [NSString stringWithFormat:@"%@ %@", self.spouse.firstName, self.spouse.lastName],
     [NSString stringWithFormat:@"%@ %@", self.father.firstName, self.father.lastName],
     [NSString stringWithFormat:@"%@ %@", self.mother.firstName, self.mother.lastName]
     ];
    return desc;
}

@end
