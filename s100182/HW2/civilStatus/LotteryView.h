//
//  LotteryView.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//
/*
 Declares the protocol <lottery> which LotteryController.h conforms to. 
 Uses delagate pattern in order to obtain the info (winners name) to display.
 */
#import <Foundation/Foundation.h>

@protocol lottery <NSObject>
- (NSString *)winnerName;
@end

@interface LotteryView : NSObject 

- (void)displayWinnerName;

@property (weak) id <lottery> delegate;

@end
