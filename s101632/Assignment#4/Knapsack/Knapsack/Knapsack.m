//
//  Knapsack.m
//  Knapsack
//
//  Created by Jacob Espersen on 26/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "Knapsack.h"

@implementation Knapsack


- (NSInteger)knapsackWithCapacity:(NSInteger)W items:(NSInteger)n weight:(NSInteger[])wt andValue:(NSInteger[])v{
    //base case
    if (W == 0 || n == 0) {
        return 0;
    }
    //if the nth item 
    if (wt[n-1] > W) {
        return [self knapsackWithCapacity:W items:n-1 weight:wt andValue:v];
    }else{
        NSInteger includeItem = [self knapsackWithCapacity:W-wt[n-1] items:n-1 weight:wt andValue:v];
        NSInteger notInclude = [self knapsackWithCapacity:W items:n-1 weight:wt andValue:v];
        return [self maxOfInteger1:includeItem andInteger2:notInclude];
        
    }
    
}

- (NSInteger)maxOfInteger1:(NSInteger)int1 andInteger2:(NSInteger)int2{
    if (int1 > int2) {
        return int1;
    }else{
        return int2;
    }
}


@end
