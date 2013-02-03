//
//  main.m
//  LINQ
//
//  Created by Søren Olofsson on 2/3/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArrayExtensions.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray* array = [NSMutableArray array];
        [array addObject:[NSNumber numberWithInteger:5]];
        [array addObject:[NSNumber numberWithInteger:3]];
        [array addObject:[NSNumber numberWithInteger:1]];
        
        long min = [array min:^(NSNumber *number) { return number.integerValue; }];
        long max = [array max:^(NSNumber *number) { return number.integerValue; }];
        long avg = [array average:^(NSNumber *number) { return number.integerValue; }];
        long sum = [array sum:^(NSNumber *number) { return number.integerValue; }];
        
        NSLog(@"The minimum is %ld", min); // Prints 1
        NSLog(@"The maximum is %ld", max); // Prints 5
        NSLog(@"The average is %ld", avg); // Prints 3
        NSLog(@"The sum is %ld", sum); // Prins 9
    }
    return 0;
}

