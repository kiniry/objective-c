//
//  main.m
//  MethodInvocation
//
//  Created by Jacob Espersen on 25/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Methods.h"

int main(int argc, const char * argv[])
{
    #define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
    
    @autoreleasepool {
        
        int iterations = 1000000;
        void (^doNothing)(void) =^{};
        Methods *methObj = [[Methods alloc] init];
        NSDate *timestamp;
        for (int i = 0; i <= 10; i++) {
            
            //Calls the instance method on the methObj as many times as the value of "iterations" and log the time consumption
            timestamp = [NSDate date];
            for (int j = 0; j<= iterations; j++) {
                [methObj instanceDoNothing];
            }
            NSLog(@"The time consumption for calling a instance method %d times is: %f ms", iterations, ([timestamp timeIntervalSinceNow]*-1000));
            
            //Calls the class method as many times as the value of "iterations" and log the time consumption
            timestamp = [NSDate date];
            for (int j = 0; j<= iterations; j++) {
                [Methods classDoNothing];
            }
            NSLog(@"The time consumption for calling a class method %d times is: %f ms", iterations, ([timestamp timeIntervalSinceNow]*-1000));
            
            //Calls the block as many times as the value of "iterations" and log the time consumption
            timestamp =[NSDate date];
            for (int j = 0; j<= iterations; j++) {
                doNothing();
            }
            NSLog(@"The time consumption for calling a block %d times is: %f ms", iterations, ([timestamp timeIntervalSinceNow]*-1000));
            iterations *= 2;
            
        }
        
    }
    return 0;
}


