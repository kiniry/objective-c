//
//  TimerThread.h
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 01/02/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"

@interface TimerThread : NSObject


/*
 
 Is not uses currently!!!!
 
 */



@property BOOL newTaskMayBeScheduled;

- (id)initWithTaskQueue:(PriorityQueue*)taskQueue;
- (void)run;
- (void)printPeek;

@end
