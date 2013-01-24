//
//  LotteryController.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//
/*
 Controller for lottery. Has instances of lottery view (lotview) and lottery brain (lotBrain).Makes lotView display name of lottery winner supplied by lotBrain.
 The pupose of the lottery classes is to demonstrate use of protocol and delegation pattern.
 */
#import <Foundation/Foundation.h>
#import "LotteryView.h"
#import "LotteryBrain.h"

@interface LotteryController : NSObject <lottery>   //protocol <lottery> is found at LotteryView.h

- (NSString *)winnerName;       //method called by delegator. Can be called because of <lottery> protocol

@property (nonatomic) LotteryView *lotView;
@property LotteryBrain *lotBrain;

@end
