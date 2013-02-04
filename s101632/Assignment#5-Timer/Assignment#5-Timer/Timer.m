//
//  Timer.m
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 30/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "Timer.h"
#import "TimerTask.h"


@implementation Timer



/*
 The init method will initialize the priorityQueue to sort the elements in the queue by date
 */
- (id)init{
    if (self = [super init]) {
        self.newTaskMayBeScheduled = YES;
        self.queue = [[PriorityQueue alloc] initWithComperator:^(TimerTask* obj1, TimerTask* obj2){
            return [obj1.nextExecution compare:obj2.nextExecution];
        }];
        dispatch_queue_t timerQueue = dispatch_queue_create("Timer", NULL);
        dispatch_async(timerQueue, ^{
            [self timerLoop];
        });
    }
    return self;
};




- (void)scheduleAtDate:(NSDate *)date withTask:(void (^)(void))task{
    NSAssert([[[NSDate date] laterDate:date] isEqualToDate:date],@"illegal executiondate");
  //  NSAssert(self.myThread.newTaskMayBeScheduled,@"Timer is cancelled");
    TimerTask* newTask;
    newTask = [[TimerTask alloc] initWith:task executionTime:date andPeriod:nil];
    newTask.state = SCHEDULED;
    [self.queue add:newTask];
    [self.queue signal];
    
    
}


-(void)timerLoop{
    while (true) {
        @try {
            [self.queue lock];
            TimerTask* task;
            BOOL taskFire;
            BOOL isEmpty = [self.queue isEmpty];
            if (isEmpty && self.newTaskMayBeScheduled) [self.queue wait];
            if (isEmpty && !self.newTaskMayBeScheduled) break;
            task = self.queue.peek;
            
            //Sets taskFire to YES if the execution date has come
            taskFire = [[task.nextExecution earlierDate:[NSDate date]] isEqualToDate:task.nextExecution];
            if (taskFire) {
                if (task.period != nil) {
                    [self.queue removeAtIndex:0];
                }
                //Reschedule is unimplemented
            if (!taskFire) [self.queue waitUntilDate:task.nextExecution];
            }
            if (taskFire){
                dispatch_async(dispatch_get_main_queue(),^{
                task.task();
                });
            }
        }
        @catch (NSException *exception) {
            
        }
    }
}

@end
