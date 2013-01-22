//
//  Nobleperson.m
//  Assignment3-Logging
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
    if (![fiancee isKindOfClass:[Nobleperson class]])
    {
        NSLog(@"marry constraint failure: Cannot marry unnoble person");
        return;
    } else
    {
        Nobleperson *nobleFiancee = (Nobleperson *)fiancee;
        if (!(nobleFiancee.butler || self.butler))
        {
            NSLog(@"marry constraint failure: Cannot marry without any butler");
            return;
        } else
        {
            [super marry:fiancee];
            NSLog(@"Congratulations, %@ & %@! You are now married with style...",self.name,fiancee.name);
            
            [self setAssets:self.assets];
        }
    }
}

-(void) setAssets:(NSNumber *)assets
{
    if ([assets intValue] <= minAssets)
    {
        NSLog(@"setAssets constraint failure: Number less or equals to min value");
        return;
    } else
    {
        if (self.spouse)
        {
            Nobleperson *nobleSpouse = (Nobleperson *)self.spouse;
            _assets = [NSNumber numberWithFloat:(([assets floatValue] +[nobleSpouse.assets floatValue])/2)];
            [nobleSpouse setAssetsWithoutSharing:_assets];
        } else
        {
            _assets = assets;
        }
    }
}

-(void) setAssetsWithoutSharing:(NSNumber *)assets
{
    if ([assets intValue] <= minAssets)
    {
        NSLog(@"setAssetsWithoutSharing constraint failure: Number less or equals to min value");
        return;
    } else
    {
        _assets = assets;
    }
}

@end
