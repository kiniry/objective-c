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

-(BOOL) impedimentToMarriage:(NoblePerson *)aCitizen {
    BOOL anyImpedimentsFromSuper = [super impedimentToMarriage:aCitizen];
    BOOL bothAreNoblePersons = ([aCitizen isMemberOfClass:[NoblePerson class]]);
    BOOL thereIsAButler = self.butler != nil || ((NoblePerson *)aCitizen).butler != nil;
    
    BOOL anyImpediments = anyImpedimentsFromSuper || !bothAreNoblePersons || !thereIsAButler;
    
    NSLog(@"Any impediments for noble persons: %d", anyImpediments);
    
    if(_DEBUG && !(bothAreNoblePersons))
        NSLog(@"You should not marry a normal citizen!");
    if(_DEBUG && !(thereIsAButler))
        NSLog(@"How are you suppose to live witout a butler?");
    
    return anyImpediments;
}

-(id)initWithName:(NSString *)aGivenName Sex:(NSString *)aSex Age:(int)anAge Assets:(int)moneyInTheBank Butler:(Citizen *)aButler {
    if(self = [super initWithName:aGivenName Sex:aSex Age:anAge]) {
        self.assets = moneyInTheBank;
        self.butler = aButler;
    }
    
    return self;
}

-(void)marry:(NoblePerson *)fiancee {
    if(_DEBUG && !(self.butler != nil || fiancee.butler != nil))
        NSLog(@"Neither of you have a butler!");
    if(_DEBUG && !([fiancee isMemberOfClass:[NoblePerson class]]))
        NSLog(@"You should not marry a normal citizen!");
    
    if(fiancee != nil && ![self impedimentToMarriage:fiancee]) {
        [super marry:fiancee];
        
        int oldSelfAssets = self.assets;
        int oldFianceeAssets = fiancee.assets;
        
        int shareOfAssets = (fiancee.assets + self.assets)/2;
        shareOfAssets -= 50000/2;
        self.assets = shareOfAssets;
        fiancee.assets = shareOfAssets;
        
        NSLog(@"Noble persons married with style");
        
        if(_DEBUG && !((self.assets + fiancee.assets) == (oldSelfAssets + oldFianceeAssets - 50000)))
            NSLog(@"Did you lose any assets?");
    }
    else {
        NSLog(@"Noble persons could not be married");
    }
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@, is a noble person, who has %d dollars in the bank, and %@", [super description], self.assets, (self.butler.name == nil ? @"has no butler!" : [NSString stringWithFormat:@"has a butler named %@", self.butler.name])];
}

@end
