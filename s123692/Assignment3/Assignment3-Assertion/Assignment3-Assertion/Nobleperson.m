//
//  Nobleperson.m
//  Assignment3-Assertion
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Nobleperson.h"

@implementation Nobleperson

int minAssets = 1000000;

@synthesize assets = _assets,
            butler = _butler;


-(void) marry:(Citizen *)fiancee
{
    NSAssert([fiancee isKindOfClass:[Nobleperson class]], @"marry constraint failure: Cannot marry unnoble person");
    
    Nobleperson *nobleFiancee = (Nobleperson *)fiancee;
    
    NSAssert(nobleFiancee.butler || self.butler, @"marry constraint failure: Cannot marry without any butler");
    
    [super marry:fiancee];
    NSLog(@"Congratulations, %@ & %@! You are now married with style...",self.name,fiancee.name);
    
    [self setAssets:self.assets];
    
}

-(void) setAssets:(NSNumber *)assets
{
    NSAssert([assets intValue] > minAssets, @"setAssets constraint failure: Number less or equals to min value");
    
    if (self.spouse)
    {
        Nobleperson *nobleSpouse = (Nobleperson *)self.spouse;
        NSNumber *newAssets = [NSNumber numberWithFloat:(([assets floatValue] +[nobleSpouse.assets floatValue])/2)];
        _assets = newAssets;
        [nobleSpouse setAssetsWithoutSharing:_assets];
        
        NSAssert(self.assets == newAssets, @"setAssets failure: your shared assets were not set");
    } else
    {
        _assets = assets;
        
        NSAssert(self.assets == assets, @"setAssets failure: your unshared assets were not set");
    }
}

-(void) setAssetsWithoutSharing:(NSNumber *)assets
{
    NSAssert([assets intValue] > minAssets, @"setAssetsWithoutSharing constraint failure: Number less or equals to min value");
    
    _assets = assets;
    
    NSAssert(self.assets == assets, @"setAssetsWithoutSharing failure: your unshared assets were not set");
}

@end
