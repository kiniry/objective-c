//
//  NoblePerson.m
//  Assignment2
//
//  Created by Philip Nielsen on 14/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age assets:(float)assets
{
    self = [super initWithName:name sex:sex age:age];
    
    if (self) {
        _assets = assets;
    }
    return self;
}

- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age parents:(NSArray *)parents assets:(float)assets
{
    self = [super initWithName:name sex:sex age:age parents:parents];
    
    if (self) {
        _assets = assets;
    }
    return self;
}

- (void)marryToCitizen:(Citizen *)newSpouse
{
    if (![newSpouse isKindOfClass:[NoblePerson class]]) return;
    
    NoblePerson *nobleSpouse = (NoblePerson *)newSpouse;
    if (!nobleSpouse.butler) return;
    
    [super marryToCitizen:nobleSpouse];
    
    if ([self.spouse isEqualTo:nobleSpouse]) {
        NSLog(@"Wedding celebrated with style");
        
        float combinedAssets = self.assets + nobleSpouse.assets;
        
        self.assets = combinedAssets / 2;
        nobleSpouse.assets = combinedAssets / 2;
        
        NSLog(@"New assets of %@: %f", self, self.assets);
    }
}

- (void)setButler:(Citizen *)newButler
{
    // A butler cannot be a noble person
    if ([newButler isKindOfClass:[NoblePerson class]]) return;
    _butler = newButler;
}

@end
