//
//  TimerTask.m
//  Assignment5
//
//  Created by Markus Færevaag on 06.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "TimerTask.h"


typedef void(^Task)(void);


@interface TimerTask()

@property (nonatomic, copy) Task task;
@property BOOL cancelled;

@end


@implementation TimerTask

@synthesize task = _task;
@synthesize cancelled = _cancelled;


- (id) initWithTask:(void (^)(void))task
{
    self = [super init];
    if (self)
    {
        _task = task;
        _cancelled = NO;
    }
    return self;
}


- (void) run
{
    self.task();
}

- (void) cancel
{
    self.cancelled = YES;
}

- (BOOL) isCancelled
{
    return self.cancelled;
}

@end
