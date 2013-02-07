//
//  main.m
//  Assignment5
//
//  Created by Markus Færevaag on 06.02.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"
#import "TimerTask.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Timer *timer = [[Timer alloc] init];
        
        TimerTask *task = [[TimerTask alloc] initWithTask: ^{
            
            for (int i = 0; i < 1; i++) {
                fprintf(stdout,"TIMER TASK \n");
            }
            
        }];
        
        NSNumber *delay = @2;

//        [timer scheduleTask:task withDelay:delay];
//        NSLog(@"Hogz much?"); // Should print immediately
        
        [timer scheduleTask:task
                  withDelay:delay
                  andPeriod:@1];
        NSLog(@"Hogz much?"); // Should print immediately
        
        sleep(6);
        NSLog(@"CANCEL");
        [task cancel];
        
        while (YES) {
            // Infinite loop
            // So the app doesnt terminate before
            // the task has been run.
        }
        
    
    }
    return 0;
}

