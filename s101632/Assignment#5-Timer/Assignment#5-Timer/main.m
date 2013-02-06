//
//  main.m
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 30/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Timer *timer = [[Timer alloc] init];
        NSTimeInterval delay = 1;
        NSDate* taskDate = [[NSDate date] dateByAddingTimeInterval:delay];
        [timer scheduleAtDate:taskDate withTask:^{
            NSLog(@"virker det?");
        }];
        NSLog(@"While thread is running");
       
        
        
    }
    return 0;
}

