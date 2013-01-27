//
//  BONNoble.m
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch, s113432, and Jacob Gjerstrup, s113440. All rights reserved.
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

// The setter for assets are done below - it checks if assets are below 50000,
// which is the minimum required amount of assets to be a noble, and if it isn't
// below 50000, it sets the assets. However, if it is below 50000, the assets are
// set to 0, the butler reference is removed, and the noble is changed into a
// normal citizen.
- (void)setAssets:(int)assetsToBeSet {
    if (assetsToBeSet < 50000){
        if (self.hasSpouse){
            [self divorce];
        }
        assets = 0;
        self.butler = nil;
        self->isa = [BONCitizen class];
        
    }
    else {
        assets = assetsToBeSet;
    }
}

// Below is a setter version where Assertions are used. It simply ensures that
// the assets set are a none-negative number.
- (void)setAssetsWithAssertion:(int)assetsToBeSet {
    NSAssert(assetsToBeSet >= 0, @"Assets are less than zero");
    if (assetsToBeSet < 50000){
        if (self.hasSpouse){
            [self divorce];
        }
        assets = 0;
        self.butler = nil;
        self->isa = [BONCitizen class];
        
    }
    else {
        assets = assetsToBeSet;
    }
}

// Another setter version using exceptions - this also ensures the assets are
// a none-negative number
- (void)setAssetsWithException:(int)assetsToBeSet {
    if(assetsToBeSet >= 0){
        [NSException raise: @"Invalid assets" format: @"Assets should not be less than zero.", age]
    }
    if (assetsToBeSet < 50000){
        if (self.hasSpouse){
            [self divorce];
        }
        assets = 0;
        self.butler = nil;
        self->isa = [BONCitizen class];
        
    }
    else {
        assets = assetsToBeSet;
    }
}

// And finally, the last version of the setter using logging, which
// sends a command to the log if the assets to be set are negative.
- (void)setAssetsWithLog:(int)assetsToBeSet {
    if (assetsToBeSet < 0){
        NSLog(@"Assets have been set to less than zero.");
    }
    if (assetsToBeSet < 50000){
        if (self.hasSpouse){
            [self divorce];
        }
        assets = 0;
        self.butler = nil;
        self->isa = [BONCitizen class];
        
    }
    else {
        assets = assetsToBeSet;
    }
}
// A custom divorce method for the noble is defined - this is because if a noble
// has a divorce, their assets will need to be split. After this split is done,
// the standard divorce method is called in the return call.
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