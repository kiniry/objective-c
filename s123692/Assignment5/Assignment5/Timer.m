//
//  Timer.m
//  Assignment5
//
//  Created by Markus Færevaag on 06.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Timer.h"


@interface Timer()

@property dispatch_queue_t queue;

@end


@implementation Timer

@synthesize queue = _queue;


#pragma mark - Initialization

- (id) init
{
    self = [super init];
    if (self)
    {
        _queue = dispatch_queue_create("com.mafaer.timer.queue", NULL);
    }
    return self;
}

// Handled by ARC on iOS 6.0 and Mac OS X 1.8, and later
//- (void) dealloc
//{
//    dispatch_release(_queue);
//}


#pragma mark - Methods

//- (void) schedule:(Callback)callback withDelay: (int)delay
//{
//    
//    NSLog(@"Implementation: %d ms", delay);
//    sleep(delay/1000);
//
//    callback();
//}

- (void) runTask: (TimerTask *)task withDelay: (int)delay
{
    NSLog(@"In run");
    sleep(delay/1000);
    dispatch_async(self.queue, ^{
        [task run];
    });
}

- (void) scheduleTask: (TimerTask *)task
            withDelay:(int)delay
{
    NSLog(@"In schedule");
    if (!task.isCancelled)
        [self runTask:task withDelay:delay];
}

- (void) scheduleTask:(TimerTask *)task
            withDelay:(int)delay
            andPeriod:(long)period
{
    NSLog(@"In schedule");
    if (!task.isCancelled)
        [self runTask:task withDelay:delay];
}



@end
