//
//  AlarmClock.m
//  Assignment3
//
//  Created by Philip Nielsen on 15/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "AlarmClock.h"

@implementation AlarmClock

@synthesize hour = _hour, minute = _minute;

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end
