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
            
            fprintf(stdout,"TIMER TASK");
            
        }];
        
        int delay = 1000;
        
//        [timer scheduleTask: ^
//        {
//             
//            NSLog(@"IT RUNZ");
//             
//        } withDelay:delay];

        [timer scheduleTask:task withDelay:delay];
    
    }
    return 0;
}

