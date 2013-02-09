//
//  Timer.m
//  Assignment5
//
//  Created by Kim Gad Thomsen on 2/4/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "Timer.h"
#import "Schedulable.h"
@implementation Timer
@synthesize tasks;

- (id) init {

    self = [super init];
    if (self) {
        self.tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addTask: (id<Schedulable>) task andRunWithInterval: (int) interval {
    [self.tasks addObject:task];
}

-(void) runTasks {
    [[self.tasks objectAtIndex:0] schedule];
}

@end
