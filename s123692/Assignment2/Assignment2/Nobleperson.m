//
//  Nobleperson.m
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Nobleperson.h"

@implementation Nobleperson

int minAssets = 1000000;

@synthesize assets = _assets, butler = _butler;

-(void) setAssets:(NSNumber *)assets
{
    if ([assets intValue] > minAssets)
    {
        _assets = assets;
    }
}

-(void) marryTo:(Citizen *)fiancee
{
    if (![fiancee isKindOfClass:[Nobleperson class]]) return;
    Nobleperson *nobleFiancee = (Nobleperson *)fiancee;
    if (nobleFiancee.butler || self.butler)
    {
        self.assets = [NSNumber numberWithFloat:([self.assets floatValue]+[nobleFiancee.assets floatValue])];
        
        nobleFiancee.assets = self.assets;
        
        [super marryTo:fiancee];
        NSLog(@"Congratulations, %@ & %@! You are now married with style...",self.name,fiancee.name);
    }
}

@end
