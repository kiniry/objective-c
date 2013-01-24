//
//  LotteryView.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "LotteryView.h"



@implementation LotteryView

- (void)displayWinnerName
{
    NSString *winner = [self.delegate winnerName];  //sends msg to delegate method winnerName
    NSLog(@"%@",winner);
}
@end