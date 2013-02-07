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

- (void) scheduleTask: (TimerTask *)task
            withDelay: (NSNumber *)delay
{
    [self runBlock:^{
        sleep([delay intValue]);
        [task run];
    }];
}

- (void) scheduleTask: (TimerTask *)task
            withDelay: (NSNumber *)delay
            andPeriod: (NSNumber *)period
{
    [self runBlock: ^{
        if (!task.isCancelled)
        {
            NSLog(@"In PERIOD DELAY:");
            sleep([delay intValue]);
            [task run];
            
            while (!task.isCancelled)
            {
                sleep([period intValue]);
                NSLog(@"In PERIOD:");
                [task run];
            }
        }
    }];
}

- (void) cancel
{
    dispatch_suspend(self.queue);
}

- (void) resume // feature!
{
    dispatch_resume(self.queue);
}


@end
