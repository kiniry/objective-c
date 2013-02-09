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



/*
 Schedules a task and signals to the run loop that the queue is not empty anynore
 */
- (void)scheduleAtDate:(NSDate *)date withTask:(void (^)(void))task{
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
            if (isEmpty && self.newTaskMayBeScheduled) [self.queue wait];       //If the queue is empty and it is allowed to schedule tasks the thread is set on hold till there will be scheduled a task.
            if (isEmpty && !self.newTaskMayBeScheduled) break;      //If the queue is empty and it is not allowed to schedule, it will break the threads run loop and terminate
            
            task = self.queue.peek;     // sets the current task to the first task in the queue
            
            //Sets taskFire to YES if the execution date has come
            taskFire = [[task.nextExecution earlierDate:[NSDate date]] isEqualToDate:task.nextExecution];
            if (taskFire) {
                if (task.period != nil) {
                    [self.queue removeAtIndex:0];       //Removes the task from the queue
                }
                
                //Reschedule is unimplemented!!!
            }            
            if (!taskFire) {
                [self.queue waitUntilDate:task.nextExecution];       //If the execution time has not come yet the thread will wait till the execution date comes
                taskFire = YES;
            }
            if (taskFire){
                dispatch_async(dispatch_get_main_queue(),^{
                    [task run];
                });         //executes the task
            }
        }
        @catch (NSException *exception) {
            
        }
    }
}

@end
