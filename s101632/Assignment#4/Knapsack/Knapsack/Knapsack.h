//
//  Knapsack.h
//  Knapsack
//
//  Created by Jacob Espersen on 26/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Knapsack : NSObject

- (NSInteger)knapsackWithCapacity:(NSInteger)W item:(NSInteger)n weight:(NSInteger[])wt andValue:(NSInteger[])v;
- (NSInteger)maxOfInteger1:(NSInteger)int1 andInteger2:(NSInteger)int2;

@end
