//
//  TImerTask.h
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 31/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TimerTask : NSObject

typedef enum{
    SCHEDULED,
    EXECUTED,
    CANCELLED
    
} State;

@property State state;
@property (strong) void (^task)(void);
@property NSDate* nextExecution;
@property NSTimeInterval* period;

- (id)initWith:(void(^)(void))task executionTime:(NSDate*)exe andPeriod:(NSTimeInterval*)period;
- (void)run;
- (BOOL)cancel;

@end
