//
//  AlarmClockAssertion.m
//  AlarmClock
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "AlarmClockAssertion.h"
#import "AlarmClock.h"
#import "AlarmClockPrivate.h"

@implementation AlarmClockAssertion

-(void)setAlarmTimeToHour:(int) hour andMinute:(int) minute
{
    NSAssert(0 <= hour && hour <= 23, @"setAlarmTime precondition failure: hour = %d", hour);
    NSAssert(0 <= minute && minute <= 59, @"setAlarmTime precondition failure: minute = %d", minute);
    self.hour = hour;
    self.minute = minute;
}

@end
