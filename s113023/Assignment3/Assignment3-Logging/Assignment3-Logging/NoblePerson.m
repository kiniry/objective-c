//
//  NoblePerson.m
//  Assignment3-Logging
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
    // Check if possible spouse is a Noble Person
    if([APerson isKindOfClass:[NoblePerson class]]){
        //Person is a NoblePerson, we create such an instance:
        NoblePerson *ANoblePerson = (NoblePerson *)APerson;
        
        //Check wheter the two persons can be married
        if ([super canMarry:APerson]){
            //Check whether any of the Noble persons prepared for marriage have a butler
            if((ANoblePerson.butler || self.butler)){
                [super marry:ANoblePerson];
                ANoblePerson.assets = (self.assets+ANoblePerson.assets-priceForNobleMarriage);
                self.assets = (self.assets+ANoblePerson.assets-priceForNobleMarriage);
                NSLog(@"Combined assets: %f",ANoblePerson.assets);
            } else {
                if (debug){
                    NSLog(@"Precondition violation: No butler - No Marriage!");
                }
            }
        }
        else {
            if (debug){
                NSLog(@"Not a legal marriage - leads to incest or homosexuality or polygyni");
            }
        }
    } else {
        if (debug){
            NSLog(@"No nobility - No Marriage!");
        }
    }
}
- (void)setButler:(Citizen *)APerson
{
    if (debug && APerson == nil){
        NSLog(@"Precondition violation: You didn't specify a Citizen as butler");
    }
    if (debug && [APerson isKindOfClass:[NoblePerson class]]){
        NSLog(@"Precondition violation: You (%@) can't add a noble butler (%@)",self.name,self.butler.name);
    } else {
        _butler = APerson;

    }
}
- (NSString *)description
{
    NSString *citizenDescription = [super description];
    NSString *currentAssets = [NSString stringWithFormat:@", Current assets: %f",self.assets];
    NSString *butlerName = [NSString stringWithFormat:@", Butler name: %@", self.butler.name];
    return [[citizenDescription stringByAppendingString:currentAssets] stringByAppendingString:butlerName];
}

@end