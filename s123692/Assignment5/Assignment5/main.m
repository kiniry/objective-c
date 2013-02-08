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
        
        Timer *timer = [[Timer alloc] initWithThreadName:@"com.mafaer.timer.queue"];
        
        TimerTask *periodicalTask = [[TimerTask alloc] initWithTask: ^{
            fprintf(stdout,"TIMER TASK \n");
        }];
        TimerTask *oneTimeTask = [[TimerTask alloc] initWithTask: ^{
            fprintf(stdout,"ONE TIME TASK \n");
        }];
        
        if ([[NSDate alloc] init] == [[NSDate alloc] init])
            NSLog(@"IT WORKZ");
        

        [timer scheduleTask:oneTimeTask withDelay:@1];
        
        [timer scheduleTask:periodicalTask
                  withDelay:@2
                  andPeriod:@1];

        
        NSLog(@"Hogz much?");
        // Should print immediately
        // Proves that the main thread is not hogged
        
        
        // Prevent the app from terminating before we can test
        sleep(5);
        NSLog(@"CANCEL");
        [periodicalTask cancel];

        NSLog(@"Periodical: %d", periodicalTask.timesRun);
        NSLog(@"OneTime: %d", oneTimeTask.timesRun);
        
    
    }
    return 0;
}

