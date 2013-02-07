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
        
        TimerTask *periodicalTask = [[TimerTask alloc] initWithTask: ^{
            fprintf(stdout,"TIMER TASK \n");
        }];
        TimerTask *oneTimeTask = [[TimerTask alloc] initWithTask: ^{
            fprintf(stdout,"ONE TIME TASK \n");
        }];
        
        // This one-timer hogs the timer-thread til it has been run
        // To avoid, run in it in another timer instance.
        [timer scheduleTask:oneTimeTask withDelay:@3];
        NSLog(@"Hogz much?"); // Should print immediately
        
        [timer scheduleTask:periodicalTask
                  withDelay:@2
                  andPeriod:@1];
        NSLog(@"Hogz much?"); // Should print immediately

        
        sleep(10);
        NSLog(@"CANCEL");
        [periodicalTask cancel];
        
        while (YES) {
            // Infinite loop
            // So the app doesnt terminate before
            // the task has been run.
        }
        
    
    }
    return 0;
}

