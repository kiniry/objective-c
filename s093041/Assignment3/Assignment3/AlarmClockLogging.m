//
//  AlarmClockLogging.m
//  Assignment3
//
//  Created by Philip Nielsen on 15/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "AlarmClockLogging.h"

@implementation AlarmClockLogging

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute
{
    if (DEBUG && !((0 <= hour && hour < 24) || (0 <= minute && minute < 60)))
        NSLog(@"%@ precondition failure: hour = %i, minute = %i", NSStringFromSelector(_cmd), hour, minute);
    self.hour = hour;
    self.minute = minute;
}

@end
