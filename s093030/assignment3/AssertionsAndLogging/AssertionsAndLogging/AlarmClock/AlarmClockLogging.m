//
//  AlarmClockLogging.m
//  AlarmClock
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "AlarmClockLogging.h"
#import "AlarmClock.h"
#import "AlarmClockPrivate.h"

@implementation AlarmClockLogging

@synthesize debugEnabled = _debugEnabled;

-(void)setAlarmTimeToHour:(int) hour andMinute:(int) minute
{
    if (self.debugEnabled & !((0 <= hour && hour <= 23)) &&
        (0 <= minute && minute <= 59))
    {
        NSLog(@"setAlarmTime precondition failure: hour = %d, minute = %d", hour, minute);
        return;
    }
    
    self.hour = hour;
    self.minute = minute;
    
}

@end
