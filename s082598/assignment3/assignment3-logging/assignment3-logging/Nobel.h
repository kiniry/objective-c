//
//  Nobel.h
//  assignment2
//
//  Created by Jonas Eriksen on 21/01/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface Nobel : Citizen

@property (retain) Citizen *butler;
// assets in dollars
@property (assign) int assets;
// redefine spouse to be Nobel
@property (retain, readonly) Nobel *spouse;

- (BOOL) impedimentToMarriageWith:(Nobel *)fiancee;
- (void) marryCitizen:(Nobel *)fiancee;

- (id)initWithName:(NSString *)name withSex:(Sex)sex withAge:(int)age withAssets:(int)assets;


@end
