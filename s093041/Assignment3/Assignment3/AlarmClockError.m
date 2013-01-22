//
//  AlarmClockError.m
//  Assignment3
//
//  Created by Philip Nielsen on 21/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "AlarmClockError.h"

@implementation AlarmClockError

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute error:(NSError **)error
{
    if (!((0 <= hour && hour < 24) || (0 <= minute && minute < 60))) {
        NSDictionary *errorDetail = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:@"Precondition failure: hour = %i, minute = %i", hour, minute]};
        *error = [NSError errorWithDomain:@"someDomain" code:100 userInfo:errorDetail];
        return;
    }
        
    self.hour = hour;
    self.minute = minute;
}

@end
