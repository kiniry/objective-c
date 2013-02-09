//
//  TimeTask.h
//  Assignment4
//
//  Created by Markus Færevaag on 24.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#define TimeTask(task, description) do {                            \
    NSLog(@"Task started: %@", description);                        \
    NSDate *start = [NSDate date];                                  \
    task;                                                           \
    NSTimeInterval timeInterval = [start timeIntervalSinceNow] * 1000;\
    NSLog(@"> finished in %0.2f ms", fabsf(timeInterval));          \
} while (NO)                                                        \
