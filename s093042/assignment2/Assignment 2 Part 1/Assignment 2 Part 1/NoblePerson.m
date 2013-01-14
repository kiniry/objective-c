//
//  NoblePerson.m
//  Assignment 2 Part 1
//
//  Created by Sivanujann Selliah on 14/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

@synthesize assets = _assets;
@synthesize butler = _butler;

-(BOOL) impedimentToMarriage:(Citizen *)aCitizen {
    BOOL anyImpediments = [super impedimentToMarriage:aCitizen] || !([aCitizen isMemberOfClass:[NoblePerson class]]);
    
    NSLog(@"Any impediments for noble persons: %d", anyImpediments);
    
    return anyImpediments;
}

-(void)marry:(Citizen *)aCitizen {
    if(![self impedimentToMarriage:aCitizen]) {
        [super marry:aCitizen];
    
        int shareOfAssets = (((NoblePerson *)self.spouse).assets + self.assets)/2;
        shareOfAssets -= 50000/2;
        self.assets = shareOfAssets;
        ((NoblePerson *)self.spouse).assets = shareOfAssets;
    
        NSLog(@"Noble persons married with style");
    }
    else {
        NSLog(@"Noble persons could not be married");
    }
}

@end
