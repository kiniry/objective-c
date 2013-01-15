//
//  AlarmClockDefensive.m
//  AlarmClock
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "AlarmClockDefensive.h"
#import "AlarmClock.m"

@implementation AlarmClockDefensive

-(void)setAlarmTimeToHour:(int) hour andMinute:(int) minute
{
    if (!((0 <= hour && hour <= 23)) &&
        (0 <= minute && minute <= 59))
    {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"setAlarmTime precondition failure: hour = %d, minute = %d", hour, minute]
                                     userInfo:nil];
    }
    
    self.hour = hour;
    self.minute = minute;
}

@end