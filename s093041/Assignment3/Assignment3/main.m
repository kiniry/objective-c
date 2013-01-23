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
#import "AlarmClockError.h"

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
        
        AlarmClockAssertion *assertionAlarm = [[AlarmClockAssertion alloc] init];
        [assertionAlarm setAlarmTimeToHour:21 andMinute:45]; // Legal
//        [assertionAlarm setAlarmTimeToHour:32 andMinute:78]; // Illegal ## RAISING EXCEPTION - UNCOMMENT TO RUN ##
        
        AlarmClockError *errorAlarm = [[AlarmClockError alloc] init];
        
        NSError *error = nil;
        [errorAlarm setAlarmTimeToHour:32 andMinute:78 error:&error];
        
        if (error)
            NSLog(@"%@", error.userInfo); // Inform user that input is incorrect
        // Otherwise continue
        
    }
    return 0;
}

