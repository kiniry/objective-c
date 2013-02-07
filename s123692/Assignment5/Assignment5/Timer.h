//
//  Timer.h
//  Assignment5
//
//  Created by Markus Færevaag on 06.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <dispatch/dispatch.h>
#import "TimerTask.h"


//typedef void (^Callback)(void);

@interface Timer : NSObject

- (id) init;
- (id) initWithThreadName: (NSString *)name;

//- (void) schedule: (Callback)callback withDelay: (int)delay;

- (void) scheduleTask: (TimerTask *)task
            withDelay: (NSNumber *)delay;

- (void) scheduleTask: (TimerTask *)task
            withDelay: (NSNumber *)delay
            andPeriod: (NSNumber *)period;

@end
