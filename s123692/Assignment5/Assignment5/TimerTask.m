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

@end

@implementation TimerTask

@synthesize task = _task;

- (id) initWithTask:(void (^)(void))task
{
    self = [super init];
    if (self)
    {
        _task = task;
    }
    return self;
}

- (void) run
{
    self.task();
}

@end
