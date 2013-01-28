//
//  NoblePerson.m
//  assignment2
//
//  Created by Radu Gatej on 1/13/13.
//  Copyright (c) 2013 Radu Gatej. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

@synthesize butler = _butler;
@synthesize assets = _assets;

-(NoblePerson*)init:(NSString *)name sex:(Sex)sex age:(unsigned int)age assets:(int)assets butler:(Citizen *)butler {
    self = [super init:name sex:sex age:age];
    self.butler = butler;
    self.assets = assets;
    
    return self;
}

-(int)independenceAssets {
    return 100;
}

-(int)styledWeddingCost {
    return 50;
}

-(BOOL)canMarry:(Citizen *)citizen {
    if(![citizen isKindOfClass:[NoblePerson class]]) return NO;
    return [super canMarry:citizen];
}

-(void)marry:(Citizen *)citizen {
    if([self canMarry:citizen] && [citizen canMarry:self]) {
        self.spouse = citizen;
        citizen.spouse = self;
        NoblePerson *nobleSpouse = (NoblePerson *)citizen;
        int sharedAssets = self.assets + nobleSpouse.assets - self.styledWeddingCost;
        self.assets = sharedAssets/2;
        nobleSpouse.assets = sharedAssets/2;
        self.butler = nobleSpouse.butler;
    }
}

-(BOOL)meetsConstraints{
    if(self.assets < self.independenceAssets) return NO;
    if(self.single && self.assets < self.independenceAssets + self.styledWeddingCost) return NO;
    return YES;
}
@end
