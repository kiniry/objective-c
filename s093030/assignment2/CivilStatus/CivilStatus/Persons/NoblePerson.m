//
//  NoblePerson.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

@synthesize assets = _assets, butler = _butler;

-(NSNumber*) assets
{
    if(_assets == nil) _assets = [NSNumber numberWithFloat: 0];
    return _assets;
}

// Will always fail because you need to hire a butler simoultaneosly
-(BOOL) marry:(Citizen*) fiancee
{
    return false;
}

// Overrides to make sure that noble persons only marry noble persons
-(BOOL) marry:(NoblePerson*) nobleFiancee andHireButler: (Citizen*)butler
{
    if(butler == nil) return false;
    
    double oldAssets = self.assets.doubleValue;
    double newAssets = oldAssets + nobleFiancee.assets.doubleValue;
    
    if(newAssets >= oldAssets - 50000 && [super marry:nobleFiancee])
        return (self.butler = butler) != nil; // Assign and return true
    
    return false;
}

-(NSNumber *) getAssets
{
    return [NSNumber numberWithFloat:
            (self.single ?
                self.assets.doubleValue
             :
                self.assets.doubleValue +  ((NoblePerson *)self.spouse).assets.doubleValue)
            ];
}

@end
