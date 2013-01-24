//
//  Nobel.m
//  assignment2
//
//  Created by Jonas Eriksen on 21/01/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import "Nobel.h"

@interface Nobel ()
// redefine spouse to be Nobel
@property (retain, readwrite) Nobel *spouse;

@end

// a Nobel need a minimum of assets
int minAsset = 60000;
// a wedding with styoe is costly
int weddingCosts = 50000;

@implementation Nobel

@synthesize butler = _butler;
@synthesize assets = _assets;
@synthesize spouse = _spouse;

- (id)initWithName:(NSString *)name withSex:(Sex)sex withAge:(int)age withAssets:(int)assets;
{
    self = [super initWithName:name withSex:sex withAge:age];
    if(self){
        NSAssert(assets >= 0, @"asset has to be possitive");
        
        self.assets = assets;
        
        NSAssert(self.assets == assets, @"assets was not set properly");
    }
        
    return self;
}

- (BOOL) impedimentToMarriageWith:(Nobel *)fiancee
{
    NSAssert(fiancee, @"argument (fiancee) cannot be nil");
    
    // first check normal citizen rules
    if([super impedimentToMarriageWith:fiancee])
        return YES;
    
    // no butler, no marriage
    if(!self.butler && !fiancee.butler)
        return YES;
    
    // no asset, no marriage
    if(self.assets + fiancee.assets - weddingCosts < minAsset)
        return YES;
    
    return NO;
}

- (void) marryCitizen:(Nobel *)fiancee
{
    NSAssert(fiancee, @"argument (fiancee) cannot be nil");
    
    // if alredy married to fiancee, do nothing
    if(self.spouse == fiancee)
        return;
    
    // is marriage possible?
    NSAssert(![self impedimentToMarriageWith:fiancee], @"%@ and %@ is impediment to marriage", self.name, fiancee.name);
    
    self.spouse = fiancee;
    
    NSAssert(self.spouse == fiancee, @"Spouse was not set properly");
    
    // if already fiancees spouse, end here
    if(fiancee.spouse == self)
        return;
    
    // make sure to also be fiancee spouse
    [fiancee marryCitizen:self];
    
    NSAssert(fiancee.spouse == self, @"Spouse of fiancee was not set properly");
    
    // share assets
    self.assets = self.assets + fiancee.assets - weddingCosts;
    fiancee.assets = self.assets;
    
    NSAssert(self.assets == fiancee.assets, @"Assets was not shared properly");
    
}

- (void) divorce
{
    // Divorse like a citizen
    [super divorce];
    // divide the assets
    self.assets /= 2;
    
}

@end
