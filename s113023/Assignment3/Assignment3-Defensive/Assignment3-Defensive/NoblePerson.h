//
//  NoblePerson.h
//  Assignment3-Defensive
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen

@property (atomic)float assets;
@property (nonatomic,strong)Citizen *butler;

- (Citizen *)initWithName:(NSString *)name
                  withSex:(NSString *)sex
                  withAge:(NSNumber *)age
               withAssets:(float)assets;

- (void)marry:(Citizen *)APerson;
- (void)setButler:(Citizen *)APerson;
- (NSString *)description;

@end
