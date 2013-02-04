//
//  Citizen.h
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface CitizenAssert : Citizen
-(void) divorce;
-(bool) marry: (Citizen*) fiance;
-(void) addChild: (Citizen*) child;


@end
