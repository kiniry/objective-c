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
@property NSMutableArray *tmpQueues;
@property BOOL isSuspended;

@end


@implementation Timer

@synthesize queue = _queue;
@synthesize tmpQueues = _tmpQueues;
@synthesize isSuspended = _isSuspended;


#pragma mark - Initialization

- (id) init
{
    self = [super init];
    if (self)
    {
        // Creating thread with unique name
        NSString *timestamp = [NSString stringWithFormat:@"%0.0f", [[NSDate date] timeIntervalSince1970]];
        _queue = dispatch_queue_create([timestamp UTF8String], NULL);
        _tmpQueues = [[NSMutableArray alloc] init];
        _isSuspended = NO;
    }
    return self;
}

- (id) initWithThreadName: (NSString *)name
{
    self = [super init];
    if (self)
    {
        _queue = dispatch_queue_create([name UTF8String], NULL);
        _tmpQueues = [[NSMutableArray alloc] init];
        _isSuspended = NO;
    }
    return self;
}

// dispatch_release(_queue) is handled by ARC


#pragma mark - Methods

//- (void) schedule:(Callback)callback withDelay: (int)delay
//{
//    
//    NSLog(@"Implementation: %d ms", delay);
//    sleep(delay/1000);
//
//    callback();
//}

- (void) runBlock: (void (^)(void))block
{
    dispatch_async(self.queue, ^{ block(); });
}

- (void) whileTask: (TimerTask *)task withPeriod: (NSNumber *)period
{
    while (!task.isCancelled)
    {
        sleep([period intValue]);
        [task run];
    }
}

- (void) scheduleTask: (TimerTask *)task
            withDelay: (NSNumber *)delay
{
    if (self.isSuspended)
        return (void) nil;

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)([delay doubleValue] * NSEC_PER_SEC));
    dispatch_after(popTime, self.queue, ^(void)
    {
        [task run];
    });
}

- (void) scheduleTask: (TimerTask *)task
            withDelay: (NSNumber *)delay
            andPeriod: (NSNumber *)period
{
    if (self.isSuspended)
        return (void) nil;

    // Fire initial with delay
    [self scheduleTask:task withDelay:delay];
    
    // Creating temp thread with unique name
    NSString *timestamp = [NSString stringWithFormat:@"%0.0f", [[NSDate date] timeIntervalSince1970]];
    dispatch_queue_t tmp = dispatch_queue_create([timestamp UTF8String], NULL);
    [self.tmpQueues addObject:tmp];
    
    // Create periodical loop in new tmp thread
    // which fires back in timer-thread
    dispatch_async(tmp, ^
    {
        [self whileTask:task withPeriod:period];
    });
}

- (void) cancel
{
    dispatch_suspend(self.queue);
    for (dispatch_queue_t tmpQueue in self.tmpQueues)
    {
        dispatch_suspend(tmpQueue);
    }
}

- (void) resume // feature!
{
    dispatch_resume(self.queue);
    for (dispatch_queue_t tmpQueue in self.tmpQueues)
    {
        dispatch_resume(tmpQueue);
    }
}


@end
