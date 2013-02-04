//
//  main.m
//  Assignment5
//
//  Created by Kim Gad Thomsen on 2/4/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"
#import "ScheduableTask.h"

int main(int argc, const char * argv[])
{

//    @autoreleasepool {
        Timer *timer = [[Timer alloc] init];
        ScheduableTask *task = [[ScheduableTask alloc] init];

        [timer addTask:task andRunWithInterval:1];
        [timer runTasks];

//    }
    return 0;
}

