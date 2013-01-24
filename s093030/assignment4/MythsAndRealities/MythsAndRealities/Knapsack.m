//
//  Knapsack.m
//  MythsAndRealities
//
//  Created by Søren Olofsson on 1/22/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "Knapsack.h"
#import <math.h>

@interface Knapsack()

@property (nonatomic, readwrite) long size, n;
@property (nonatomic, readwrite) long *weights, *values;

@end

@implementation Knapsack

@synthesize size = _size, n = _n, values = _values, weights = _weights;

long *matrix, *picks;

- (id)initWith:(long)n ItemsAndSize:(long)size andWeights:(long[])weights andValues:(long[]) values
{
    self = [super init];
    if(self) {
        self.n = n;
        self.size = size;
        self.weights = weights;
        self.values = values;
    }
    return self;
}

-(long) solve
{
    
    // Allocate VLAs
    long size = (self.n + 1) * (self.size + 1) * sizeof(long);
    matrix = malloc(size),
    picks = malloc(size);
    long index = 0;
    
    // Loop through columns
    for (long i = 1; i <= self.n; i++)
    {
        // Loop through rows
        for (long j = 0; j <= self.size; j++)
        {
            // Calculate indexes and old value
            index = i * self.size + j;
            long indexRowBefore = index - self.size;
            long oldValue = matrix[indexRowBefore];
            
            if (self.weights[i - 1] <= j)
            {
                long newValue = self.values[i - 1] + matrix[indexRowBefore - self.weights[i - 1]];
                matrix[index] = fmax(oldValue, newValue);
                picks[index] = newValue > oldValue ? 1 : -1;
            }
            else
            {
                matrix[index] = oldValue;
                picks[index] = -1;
            }
        }
    }
    
    return matrix[index];
}

-(long) solveMutableArray
{
    
    // Allocate VLAs
    long size = (self.n + 1) * (self.size + 1) * sizeof(long);
    NSMutableArray *matrix = [[NSMutableArray alloc] initWithCapacity:size];
    picks = malloc(size);
    long index = 0;
    
    // Loop through columns
    for (long i = 1; i <= self.n; i++)
    {
        // Loop through rows
        for (long j = 0; j <= self.size; j++)
        {
            // Calculate indexes and old value
            index = i * self.size + j;
            long indexRowBefore = index - self.size;
            long oldValue = ((NSNumber*) [matrix objectAtIndex:indexRowBefore]).longValue;
            
            if (self.weights[i - 1] <= j)
            {
                long newValue = self.values[i - 1] + ((NSNumber*) [matrix objectAtIndex:(indexRowBefore - self.weights[i - 1])]).longValue;
                matrix[index] = [NSNumber numberWithLong:(fmax(oldValue, newValue))];
                picks[index] = newValue > oldValue ? 1 : -1;
            }
            else
            {
                matrix[index] = [NSNumber numberWithLong:oldValue];
                picks[index] = -1;
            }
        }
    }
    
    return ((NSNumber*) [matrix objectAtIndex:index]).longValue;
}

-(void) printPicks
{
    long item = self.n,
    size = self.size;
    
    while (item > 0)
    {
        long index = item * self.size + size;
        if (picks[index] == 1)
        {
            printf("%ld ", item - 1);
            item--;
            size -= self.weights[item];
        }
        else
        {
            item--;
        }
    }
    
    printf("\n");
    
    return;
}

// Since we have used manual memory allocation, we should override dealloc
- (void) dealloc
{
    free(matrix);
    free(picks);
    // [super dealloc]; <- provided by the compiler
}

@end
