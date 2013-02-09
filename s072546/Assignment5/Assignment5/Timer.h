//
//  Timer.h
//  Assignment5
//
//  Created by Kim Gad Thomsen on 2/4/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject

@property(nonatomic, strong) NSMutableArray *tasks;

- (void) addTask: (id) task andRunWithInterval: (int) interval;
- (void) runTasks;
@end
