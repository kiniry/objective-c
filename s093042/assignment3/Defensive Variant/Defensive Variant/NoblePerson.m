//
//  NoblePerson.m
//  Assignment 3
//
//  Created by Sivanujann Selliah on 17/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

@synthesize assets = _assets;
@synthesize butler = _butler;

-(BOOL) impedimentToMarriage:(Citizen *)aCitizen {
    BOOL anyImpedimentsFromSuper = [super impedimentToMarriage:aCitizen];
    BOOL bothAreNoblePersons = ([aCitizen isMemberOfClass:[NoblePerson class]]);
    BOOL thereIsAButler = self.butler != nil || ((NoblePerson *)aCitizen).butler != nil;
    
    BOOL anyImpediments = anyImpedimentsFromSuper || !bothAreNoblePersons || !thereIsAButler;
    
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

-(void)marry:(Citizen *)fiancee {
    if(fiancee != nil && ![self impedimentToMarriage:fiancee]) {
        [super marry:fiancee];
    
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
