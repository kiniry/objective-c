//
//  TimerTask.h
//  Assignment5
//
//  Created by Markus Færevaag on 06.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TimerTask : NSObject

@property int timesRun;


- (id) initWithTask: (void (^)(void))task;

- (void) run;

- (void) cancel;

- (BOOL) isCancelled;

@end
