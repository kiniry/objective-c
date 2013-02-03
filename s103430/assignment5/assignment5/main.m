//
//  main.m
//  assignment5
//
//  Created by Joachim on 03/02/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "Random.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        Random *rand = [[Random alloc] init];
        
        NSLog(@"#### TEST 1 ####\n\nRandom with no seed\nnextInt\t\t\t\t\t%d\nnextLong\t\t\t\t%ld\nnextFloat\t\t\t\t%.10f\nnextDouble\t\t\t\t%.10g\nnextIntWithMaxVal:10\t%d\nnextBoolean:\t\t\t%d",
              [rand nextInt],
              [rand nextLong],
              [rand nextFloat],
              [rand nextDouble],
              [rand nextIntWithMaxVal:10],
              [rand nextBoolean]);
        
        Random *rand2 = [[Random alloc] initWithSeed:100];
        
        NSLog(@"#### TEST 2 ####\n\nRandom with seed 100\nnextInt\t\t\t\t\t%d\nnextLong\t\t\t\t%ld\nnextFloat\t\t\t\t%.10f\nnextDouble\t\t\t\t%.10g\nnextIntWithMaxVal:10\t%d\nnextBoolean:\t\t\t%d",
              [rand2 nextInt],
              [rand2 nextLong],
              [rand2 nextFloat],
              [rand2 nextDouble],
              [rand2 nextIntWithMaxVal:10],
              [rand2 nextBoolean]);

    }
}
