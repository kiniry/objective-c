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
                
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && assets < 0){
            NSLog(@"Nobel Init Failure: Assets argument is negative");
            self.assets = 0;
        }
        
        self.assets = assets;
    }
        
    return self;
}

- (BOOL) impedimentToMarriageWith:(Nobel *)fiancee
{
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !fiancee){
        NSLog(@"Nobel impedimentToMarriageWith: argument (fiancee) cannot be nil");
        return YES;
    }
    
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
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !fiancee){
        NSLog(@"Nobel marryCitizen: argument (fiancee) cannot be nil");
        return;
    }
    
    // if alredy married to fiancee, do nothing
    if(self.spouse == fiancee)
        return;
    
    // is marriage possible?
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && [self impedimentToMarriageWith:fiancee]){
        NSLog(@"Citizen marryCitizen: %@ and %@ is Impediment To Marriage", self.name ,fiancee.name);
        return;
    }
    
    self.spouse = fiancee;
    
    // if already fiancees spouse, end here
    if(fiancee.spouse == self)
        return;
    
    // make sure to also be fiancee spouse
    [fiancee marryCitizen:self];
    
    // share assets
    self.assets = self.assets + fiancee.assets - weddingCosts;
    fiancee.assets = self.assets;
    
}

- (void) divorce
{
    // Divorse like a citizen
    [super divorce];
    // divide the assets
    self.assets /= 2;
    
}

@end
