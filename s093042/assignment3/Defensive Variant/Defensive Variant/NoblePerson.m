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
    
    if(!(bothAreNoblePersons))
        @throw [NSException exceptionWithName:@"Postcondition does not hold" reason:@"You should not marry a normal citizen!" userInfo:nil];
    if(!(thereIsAButler))
        @throw [NSException exceptionWithName:@"Postcondition does not hold" reason:@"How are you suppose to live witout a butler?" userInfo:nil];
    
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
    if(!(self.butler != nil || fiancee.butler != nil))
        @throw [NSException exceptionWithName:@"Precondition does not hold" reason:@"Neither of you have a butler!" userInfo:nil];
    if(!([fiancee isMemberOfClass:[NoblePerson class]]))
        @throw [NSException exceptionWithName:@"Precondition does not hold" reason:@"You should not marry a normal citizen!" userInfo:nil];
    
    if(fiancee != nil && ![self impedimentToMarriage:fiancee]) {
        [super marry:fiancee];
        
        int oldSelfAssets = self.assets;
        int oldFianceeAssets = fiancee.assets;
        
        int shareOfAssets = (fiancee.assets + self.assets)/2;
        shareOfAssets -= 50000/2;
        self.assets = shareOfAssets;
        fiancee.assets = shareOfAssets;
        
        NSLog(@"Noble persons married with style");
        
        if(!((self.assets + fiancee.assets) == (oldSelfAssets + oldFianceeAssets - 50000)))
            @throw [NSException exceptionWithName:@"Postcondition does not hold" reason:@"Did you lose any assets?" userInfo:nil];
    }
    else {
        NSLog(@"Noble persons could not be married");
    }
}


-(NSString *)description {
    return [NSString stringWithFormat:@"%@, is a noble person, who has %d dollars in the bank, and has a butler named %@.", [super description], self.assets, self.butler.name];
}
@end
