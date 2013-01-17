//
//  NoblePerson.m
//  Assignment2
//
//  Created by Andreas Haure on 10/01/13.
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
                ANoblePerson.assets = (self.assets+ANoblePerson.assets-priceForNobleMarriage)/2;
                self.assets = (self.assets+ANoblePerson.assets-priceForNobleMarriage)/2;
                NSLog(@"Combined assets: %f",ANoblePerson.assets);
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
    if (![APerson isKindOfClass:[NoblePerson class]]){
        _butler = APerson;
    }
}


@end
