//
//  AlarmClockBase.h
//  Assignment3
//
//  Created by Andreas Graulund on 15/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clock.h"

// Based on the BON given in assigment 3.

// Don't use this without subclassing it. Not for direct use.

@interface AlarmClockBase : Clock

@property NSInteger alarmTime; // This alarm's time, in monotonically increasing units.
@property NSInteger alarmHour; // This alarm's time, in hours.
@property NSInteger alarmMinute; // This alarm time, in minutes.

@end
