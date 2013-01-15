//
//  AlarmClockAssertion.m
//  Assignment3
//
//  Created by Philip Nielsen on 15/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "AlarmClockAssertion.h"

@implementation AlarmClockAssertion

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute
{
    NSAssert(0 <= hour && hour < 24, @"%@ precondition failure: hour = %i", NSStringFromSelector(_cmd), hour);
    NSAssert(0 <= minute && minute < 60, @"%@ precondition failure: minute = %i", NSStringFromSelector(_cmd), minute);
    self.hour = hour;
    self.minute = minute;
}

@end
