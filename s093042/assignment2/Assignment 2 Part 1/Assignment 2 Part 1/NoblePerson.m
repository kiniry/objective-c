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

-(id)initWithName:(NSString *)aGivenName Sex:(NSString *)aSex Age:(int)anAge Assets:(int)moneyInTheBank Butler:(Citizen *)aButler {
    if(self = [super initWithName:aGivenName Sex:aSex Age:anAge]) {
        self.assets = moneyInTheBank;
        self.butler = aButler;
    }
    
    return self;
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


-(NSString *)description {
    return [NSString stringWithFormat:@"%@, is a noble person, who has %d dollars in the bank, and has a butler named %@.", [super description], self.assets, self.butler.name];
}
@end
