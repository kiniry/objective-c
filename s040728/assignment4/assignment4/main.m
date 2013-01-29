//
//  main.m
//  assignment4
//
//  Created by Magloire on 1/28/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        NSLog(@"Before calling distanceBetween:");
        NSDate *date1 = [NSDate date];
        [LevenshteinDistance distanceBetween:@"distanceBetween" and:@"distanceUsingRecursion"];
        
        double elapsedTime1 = fabs([date1 timeIntervalSinceNow]);
       
        
        NSLog(@"Before calling distanceUsingRecursion:");
        NSDate *date2 = [NSDate date];
        [LevenshteinDistance distanceUsingRecursionBetween:@"distanceBetween" and:@"distanceUsingRecursion"];
        
        double elapsedTime2 = fabs([date2 timeIntervalSinceNow]);
        
        
        NSLog(@"the running time for distanceBetween: is %0.4f ms", elapsedTime1);
        NSLog(@"the running time for distanceUsingRecursion is %0.4f ms", elapsedTime2);
        
        
        
    }
    return 0;
}

