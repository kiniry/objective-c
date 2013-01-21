//
//  NoblePerson.m
//  Assignment3-Defensive
//
//  Created by Andreas Haure on 16/01/13.
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
                //Share butler if i have a butler already
                if (self.butler){
                    ANoblePerson.butler = self.butler;
                } else if (ANoblePerson.butler){
                    self.butler = ANoblePerson.butler;
                }
                NSLog(@"Combined assets: %f",ANoblePerson.assets);
            } else {
                NSException *noButlerException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"Precondition violation: Either one of the noble persons interested in marriage must have a butler" userInfo:nil];
               @throw noButlerException;
            }
        }
        else {
            NSException *notLegalMarriageExeception = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Precondition violation: You are not allowed to marry this person - leads to either icest, homosexyality or polygyni" userInfo:nil];
            @throw notLegalMarriageExeception;
        }
    } else {
        NSException *noNobilityException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"Precondition violation: The person you want to marry is not noble" userInfo:nil];
        @throw noNobilityException;
    }
}
- (void)setButler:(Citizen *)APerson
{
    if (APerson == nil){
        NSException *emptyButlerException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You must specify a Citizen object as butler" userInfo:nil];
        @throw emptyButlerException;
    }
    if (![APerson isKindOfClass:[NoblePerson class]]){
        _butler = APerson;
    } else {
        NSException *nobleButlerException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can't have a noble butler" userInfo:nil];
        @throw nobleButlerException;
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
