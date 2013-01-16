//
//  AlarmClockProtocol.h
//  Assignment3
//
//  Created by Philip Nielsen on 15/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlarmClockProtocol <NSObject>

@property int hour;
@property int minute;

- (void)setAlarmTimeToHour:(int)hour andMinute:(int)minute;

@end
