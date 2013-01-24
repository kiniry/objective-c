//
//  LotteryBrain.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//
/*
 This class only initializes a Citizen to be used as winner. 
 */
#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface LotteryBrain : NSObject

- (Citizen *)getLotteryWinner;

@property Citizen *winner;

@end
