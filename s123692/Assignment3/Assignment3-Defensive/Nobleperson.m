//
//  Nobleperson.m
//  Assignment3-Defensive
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
        @throw [NSException exceptionWithName:@"marry constraint failure"
                                       reason:@"Cannot marry unnoble person"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        Nobleperson *nobleFiancee = (Nobleperson *)fiancee;
        if (!(nobleFiancee.butler || self.butler))
        {
            @throw [NSException exceptionWithName:@"marry constraint failure"
                                           reason:@"Cannot marry without any butler"
                                         userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
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
        @throw [NSException exceptionWithName:@"setAssets constraint failure"
                                       reason:@"Number less or equals to min value"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
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
        @throw [NSException exceptionWithName:@"setAssetsWithoutSharing constraint failure"
                                       reason:@"Number less or equals to min value"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        _assets = assets;
    }
}

@end
