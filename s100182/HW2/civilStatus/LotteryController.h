//
//  LotteryController.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryView.h"
#import "LotteryBrain.h"

@interface LotteryController : NSObject <lottery>
- (NSString *)winnerName;
@property (nonatomic) LotteryView *lotView;
@property LotteryBrain *lotBrain;
@end
