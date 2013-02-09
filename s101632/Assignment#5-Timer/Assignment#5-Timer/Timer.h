//
//  Timer.h
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 30/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"
#import "TimerThread.h"

@interface Timer : NSObject



@property (nonatomic) PriorityQueue* queue;
@property (strong) void(^task)(void);
@property NSRunLoop* loop;
//@property TimerThread* myThread;
@property NSThread* myThread;
@property BOOL newTaskMayBeScheduled;

//- (void)cancel;
//- (int)purge;
- (void)scheduleAtDate:(NSDate*)date withTask:(void (^)(void))task;
- (void)timerLoop;
- (void)addexecutetask:(void(^)(void))task;


//          Unimplemented   | |
//                          V V
//
//- (void)scheduleTask:(void (^)(void))task onFirstDate:(NSDate*)date andRepeatAfterPeriod:(NSNumber*)period;
//- (void)scheduleTask:(void (^)(void))task afterDelay:(NSNumber*)delay;
//- (void)scheduleTask:(void (^)(void))task afterDelay:(NSNumber *)delay andRepeatAfterPeriod:(NSNumber*)period;
//- (void)scheduletask:(void (^)(void))task onFirstDate:(NSDate*)date andRepeatedWithFixedRate:(NSNumber*)period;
//- (void)scheduleTask:(void (^)(void))task afterDelay:(NSNumber *)delay andRepeatWithFixedRate:(NSNumber*)period;


@end
