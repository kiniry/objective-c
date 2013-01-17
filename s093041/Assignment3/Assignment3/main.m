//
//  main.m
//  Assignment3
//
//  Created by Philip Nielsen on 15/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlarmClockDefensive.h"
#import "AlarmClockLogging.h"
#import "AlarmClockAssertion.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        AlarmClock *basicAlarm = [[AlarmClock alloc] init];
//        [basicAlarm setAlarmTimeToHour:2 andMinute:52]; // Legal input, but not implemented ## RAISING EXCEPTION - UNCOMMENT TO RUN ##
        
        AlarmClockDefensive *defensiveAlarm = [[AlarmClockDefensive alloc] init];
        [defensiveAlarm setAlarmTimeToHour:21 andMinute:45]; // Legal
//        [defensiveAlarm setAlarmTimeToHour:32 andMinute:78]; // Illegal ## RAISING EXCEPTION - UNCOMMENT TO RUN ##
        
        AlarmClockLogging *loggingAlarm = [[AlarmClockLogging alloc] init];
        [loggingAlarm setAlarmTimeToHour:21 andMinute:45]; // Legal
        [loggingAlarm setAlarmTimeToHour:32 andMinute:78]; // Illegal
        
        AlarmClockAssertion *assertionClock = [[AlarmClockAssertion alloc] init];
        [assertionClock setAlarmTimeToHour:21 andMinute:45]; // Legal
        [assertionClock setAlarmTimeToHour:32 andMinute:78]; // Illegal
        
    }
    return 0;
}

