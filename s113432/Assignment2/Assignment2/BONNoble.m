//
//  BONNoble.m
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONNoble.h"
#import "BONCitizen.h"

@implementation BONNoble
@synthesize butler = _butler;
@synthesize assets;

- (BONCitizen *)butler {
    if (!_butler){
        _butler = [[BONCitizen alloc]init];
    }
    return _butler;
}

- (void)setAssets:(int)assetsToBeSet {
    if (assetsToBeSet < 50000){
        assets = 0;
        self.butler = nil;
        if (self.hasSpouse){
            self->isa = [BONCitizen class];
        }
    }
    else {
        assets = assetsToBeSet;
    }
}

- (bool) divorce {
    if (self.hasSpouse){
        if (self.class == [BONNoble class]){
            int newAssetsAfterDivorce = ((self.assets + self.spouse.assets)/2);
            self.spouse.assets = newAssetsAfterDivorce;
            self.assets = newAssetsAfterDivorce;
        }
    }
    return [super divorce];
}
@end