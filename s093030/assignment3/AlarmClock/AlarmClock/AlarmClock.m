//
//  AlarmClock.m
//  AlarmClock
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "AlarmClock.h"
#import "AlarmClockProtocol.h"

@interface AlarmClock()

@property (readwrite, nonatomic) int hour;
@property (readwrite, nonatomic) int minute;

@end

@implementation AlarmClock

@synthesize hour = _hour, minute = _minute;

-(void)setAlarmTimeToHour:(int) hour andMinute:(int) minute
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
