//
//  NoblePerson.m
//  Assignment3-Assertion
//
//  Created by Andreas Haure on 17/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "NoblePerson.h"

static int priceForNobleMarriage = 50000;

@implementation NoblePerson

- (Citizen *)initWithName:(NSString *)name
                  withSex:(NSString *)sex
                  withAge:(NSNumber *)age
               withAssets:(float) assets
{
    self = [super initWithName:name withSex:sex withAge:age];
    if (self)
    {
        _assets = assets;
    }
    return self;
}
- (void)marry:(Citizen *)APerson
{
    // Check preconditions
    NSAssert(APerson,@"Precondition violation: You didn't specify a Citizen to marry");
    
    // Check if possible spouse is a Noble Person
    if([APerson isKindOfClass:[NoblePerson class]]){
        //Person is a NoblePerson, we create such an instance:
        NoblePerson *ANoblePerson = (NoblePerson *)APerson;
        
        //Check wheter the two persons can be married
        if ([super canMarry:APerson]){
            //Check whether any of the Noble persons prepared for marriage have a butler
            if((ANoblePerson.butler || self.butler)){
                NSLog(@"sweethearts butler: %@",ANoblePerson.butler);
                NSLog(@"own butler: %@",self.butler);
                [super marry:ANoblePerson];
                double oldAssets = self.assets + ANoblePerson.assets;
                double newAssets = oldAssets - priceForNobleMarriage;
                ANoblePerson.assets = newAssets;
                self.assets = newAssets;
                //Share butler if i have a butler already
                if (self.butler){
                    ANoblePerson.butler = self.butler;
                } else if (ANoblePerson.butler){
                    self.butler = ANoblePerson.butler;
                }
                NSLog(@"Combined assets: %f",ANoblePerson.assets);
                
                //Check postconditions
                NSAssert(self.butler && ANoblePerson.butler,@"Postcondition violation: The butler wasn't set correctly for both noble persons after wedding");
                NSAssert(self.assets <= oldAssets - priceForNobleMarriage, @"Postcondition violation: Your assets were not updated correctly");
                NSAssert(ANoblePerson.assets <= oldAssets - priceForNobleMarriage, @"Postcondition violation: Your sweethearts assets were not updated correctly");
            } else {
                NSLog(@"No butler - No Marriage!");
            }
        }
        else {
            NSLog(@"Not a legal marriage - leads to incest or homosexuality or polygyni");
        }
    } else {
        NSLog(@"No nobility - No Marriage!");
    }
}
- (void)setButler:(Citizen *)APerson
{
    NSAssert(APerson,@"Precondition violatin: You didn't specify a Citizen as butler");
    NSAssert(![APerson isKindOfClass:[NoblePerson class]],@"Precondition violation: You can't add a noble butler");
    _butler = APerson;
    NSLog(@"The butler has been set to %@",self.butler.name);
    NSAssert(self.butler == APerson,@"Postcondition violation: The butler wasn't set correctly");
}
- (NSString *)description
{
    NSString *citizenDescription = [super description];
    NSString *currentAssets = [NSString stringWithFormat:@", Current assets: %f",self.assets];
    NSString *butlerName = [NSString stringWithFormat:@", Butler name: %@", self.butler.name];
    return [[citizenDescription stringByAppendingString:currentAssets] stringByAppendingString:butlerName];
}

@end