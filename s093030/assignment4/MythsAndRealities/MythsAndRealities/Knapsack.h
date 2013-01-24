//
//  Knapsack.h
//  MythsAndRealities
//
//  Created by Søren Olofsson on 1/22/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Knapsack : NSObject

// Properties
@property (nonatomic, readonly) long size, n;
@property (nonatomic, readonly) long *weights, *values;

// Methods
- (id)initWith:(long)n ItemsAndSize:(long)size andWeights:(long[])weights andValues:(long[]) values;
-(void) printPicks;
-(long) solve;
-(long) solveMutableArray;

@end
