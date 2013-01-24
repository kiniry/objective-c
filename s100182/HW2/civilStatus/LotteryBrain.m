//
//  LotteryBrain.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "LotteryBrain.h"

@implementation LotteryBrain
- (Citizen *)getLotteryWinner
{
    Citizen *Matthis = [[Citizen alloc] initWithFirstName:@"Lottery Matthis"
                                              andLastName:@"Baltzersen"
                                                   andAge:[NSNumber numberWithInt:(int)2]];
    return Matthis;
}

- (void)winnerSelection:(void (^)(NSString *, int, BOOL *))block
{
    
}
@end
