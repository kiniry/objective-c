//
//  AlarmClockDefensive.m
//  Assignment3
//
//  Created by Philip Nielsen on 15/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "AlarmClockDefensive.h"

@implementation AlarmClockDefensive

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute
{
    if ( !( (0 <= hour && hour < 24) || (0 <= minute && minute <= 59) ) )
        [NSException raise:NSInternalInconsistencyException
                    format:@"%@ precondition failure: hour = %i, minute = %i", NSStringFromSelector(_cmd), hour, minute];
    self.hour = hour;
    self.minute = minute;
}

@end
