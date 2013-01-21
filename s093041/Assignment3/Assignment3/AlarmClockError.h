//
//  AlarmClockError.h
//  Assignment3
//
//  Created by Philip Nielsen on 21/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "AlarmClock.h"

@interface AlarmClockError : AlarmClock

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute error:(NSError **)error;

@end
