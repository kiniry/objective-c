//
//  LotteryController.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "LotteryController.h"
#import "Citizen.h"

@implementation LotteryController

- (LotteryController *)init
{
    self = [super init];
    if (self)
    {
        self.lotView = [[LotteryView alloc] init];
        self.lotView.delegate = self;
        self.lotBrain = [[LotteryBrain alloc] init];
    }
    return self;
}

- (NSString *)winnerName
{
    //return @"LotteryController.m";
//    NSLog(@"NSLog Name: %@",[self.lotBrain getLotteryWinner].firstName);
    return [self.lotBrain getLotteryWinner].firstName;
}
@end
