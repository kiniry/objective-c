//
//  TImerTask.m
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 31/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "TimerTask.h"

@implementation TimerTask

- (id)initWith:(void (^)(void))task executionTime:(NSDate *)exe andPeriod:(NSTimeInterval *)period{
    if (self = [super init]) {
        self.task = task;
        self.nextExecution = exe;
        self.period = period;
    }
    return self;
}

- (void)run{
    self.task();
}

- (BOOL)cancel{
    //Unimplemented
    return YES;
}

@end

