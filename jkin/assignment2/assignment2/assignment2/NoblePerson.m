//
//  NoblePerson.m
//  assignment2
//
//  Created by Joseph Kiniry on 11/1/2013.
//  Copyright (c) 2013 Joseph Kiniry. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

- (BOOL)canMarry:(Citizen *)fiance {
    if([fiance isKindOfClass:[NoblePerson class]])
        return [super canMarry:fiance];
    else return NO;
}

- (void)marry:(Citizen *)spouse {
    if([self canMarry:spouse]) {
      self.spouse = spouse;
      NoblePerson *np = (NoblePerson*)spouse;
      spouse.spouse = self;
      np.butler = self.butler;
      long totalAssets = self.assets + np.assets - self.costOfWedding;
      self.assets = totalAssets / 2;
      np.assets = self.assets;
    }
}

- (NoblePerson*)init:(NSString *)a_name
                 sex:(Sex)a_sex
                 age:(ushort)an_age
              assets:(long)some_assets
              butler:(Citizen*)a_butler {
    self = [super init:a_name sex:a_sex age:an_age];
    self.assets = some_assets;
    self.butler = a_butler;
    return self;
}

- (long)enoughAssetsForIndependence {
    return 1000000;
}

- (int)costOfWedding {
    return 25000;
}

// Enough property for independence.
// Can only marry other noble person.
// Wedding celebrated with style.
// Married nobility share their assets and must have a butler.

- (BOOL)invariant {
    BOOL result = true;
    result &= (self.single ?
               self.enoughAssetsForIndependence <= self.assets : YES);
    result &= (!self.single ?
               ([self.spouse isKindOfClass:[NoblePerson class]] &&
                (((NoblePerson*)(self.spouse)).butler == self.butler)) &&
                (self.enoughAssetsForIndependence <= (self.assets +
                                                      ((NoblePerson*)(self.spouse)).assets))
                : YES);
    return result;
}

@end
