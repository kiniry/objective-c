//
//  LotteryBrain.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface LotteryBrain : NSObject

- (Citizen *)getLotteryWinner;
- (void)winnerSelection:(void (^)(NSString *name, int multiplier, BOOL *stop))block;

@property Citizen *winner;

@end
