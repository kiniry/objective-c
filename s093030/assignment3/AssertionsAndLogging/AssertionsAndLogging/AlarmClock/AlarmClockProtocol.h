//
//  AlarmClockProtocol.h
//  AlarmClockProtocol
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#ifndef AlarmClockProtocol_AlarmClockProtocol_h
#define AlarmClockProtocol_AlarmClockProtocol_h

@protocol AlarmClockProtocol <NSObject>

@property (readonly, nonatomic) int hour;
@property (readonly, nonatomic) int minute;

@required
-(void)setAlarmTimeToHour:(int) hour andMinute:(int) minute;

@end

#endif
