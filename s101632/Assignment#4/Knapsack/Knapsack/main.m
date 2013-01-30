//
//  main.m
//  Knapsack
//
//  Created by Jacob Espersen on 26/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Knapsack.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Knapsack* knap = [[Knapsack alloc] init];
        NSInteger wt[] = {10,20,30};
        NSInteger v[] = {60,100,120};
        NSInteger W = 50;
        NSInteger n = 3;
        NSInteger maxVal = [knap knapsackWithCapacity:W item:n weight:wt andValue:v];
        NSLog(@"The maximum value is: %li", maxVal);
        
    }
    return 0;
}

