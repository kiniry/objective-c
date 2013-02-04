//
//  TimerThread.m
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 01/02/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "TimerThread.h"
#import "TImerTask.h"

@interface TimerThread()

@property PriorityQueue* queue;
 
@end

@implementation TimerThread

- (id)initWithTaskQueue:(PriorityQueue*)taskQueue{
    if(self = [super init]){
        self.newTaskMayBeScheduled = YES;
        self.queue = taskQueue;
    }
    return self;
}

- (void)printPeek{
    TimerTask* task = [self.queue peek];
    task.task();
}



@end
