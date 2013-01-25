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

- (void)setAssets:(int)assetsToBeSet {
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