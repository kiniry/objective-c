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
    // Check if a valid Citizen is passed in
    NSAssert(APerson,@"Precondition violation: You didn't specify a Citizen to marry");
    
    // Check if possible spouse is a Noble Person
    NSAssert([APerson isKindOfClass:[NoblePerson class]],@"Precondition violation: Your spouse is not a noble person");
    
    //Person is a NoblePerson, we create such an instance:
    NoblePerson *ANoblePerson = (NoblePerson *)APerson;
    
    //Check wheter the two persons can be married
    NSAssert([super canMarry:APerson],@"Not a legal marriage - leads to incest or homosexuality or polygyni");
    
    //Check whether any of the Noble persons prepared for marriage have a butler specfied
    NSAssert((ANoblePerson.butler || self.butler),@"No butler - No Marriage!");
    
    //We mary the two noble persons using the Citizen marry method
    [super marry:ANoblePerson];
    
    //We update their new assets
    double oldAssets = self.assets + ANoblePerson.assets;
    double newAssets = oldAssets - priceForNobleMarriage;
    ANoblePerson.assets = newAssets;
    self.assets = newAssets;
    
    //The one that has a butler shares it with his/her new noble spouse
    if (self.butler){
        ANoblePerson.butler = self.butler;
    } else if (ANoblePerson.butler){
        self.butler = ANoblePerson.butler;
    }
                
    //Check postconditions
    NSAssert(self.butler && ANoblePerson.butler,@"Postcondition violation: The butler wasn't set correctly for both noble persons after wedding");
    NSAssert(self.assets <= oldAssets - priceForNobleMarriage, @"Postcondition violation: Your assets were not updated correctly");
    NSAssert(ANoblePerson.assets <= oldAssets - priceForNobleMarriage, @"Postcondition violation: Your sweethearts assets were not updated correctly");
  
}
- (void)setButler:(Citizen *)APerson
{
    // Check whether a valid Citizen was passed in
    NSAssert(APerson,@"Precondition violatin: You didn't specify a Citizen as butler");
    // Check that the butler is not of noble class
    NSAssert(![APerson isKindOfClass:[NoblePerson class]],@"Precondition violation: You can't add a noble butler");
    _butler = APerson;
    NSLog(@"The butler has been set to %@",self.butler.name);
    // Check postconditions
    NSAssert(self.butler == APerson,@"Postcondition violation: The butler wasn't set correctly");
}
- (NSString *)description
{
    // Print NoblePerson discription using Citizen description method and adding assets and butler
    NSString *citizenDescription = [super description];
    NSString *currentAssets = [NSString stringWithFormat:@", Current assets: %f",self.assets];
    NSString *butlerName = [NSString stringWithFormat:@", Butler name: %@", self.butler.name];
    return [[citizenDescription stringByAppendingString:currentAssets] stringByAppendingString:butlerName];
}

@end