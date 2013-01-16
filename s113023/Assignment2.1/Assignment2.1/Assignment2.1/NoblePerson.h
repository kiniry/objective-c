//
//  NoblePerson.h
//  Assignment2
//
//  Created by Andreas Haure on 10/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

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

@end