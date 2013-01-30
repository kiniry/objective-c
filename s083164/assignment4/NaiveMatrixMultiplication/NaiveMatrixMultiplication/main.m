//
//  main.m
//  NaiveMatrixMultiplication
//
//  Created by Emil Klarskov Kristensen on 1/30/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *a = @[ @[ @2,@4,@6,@7 ], @[ @8,@2,@3,@5 ], @[ @2,@3,@7,@5 ], @[ @9,@3,@2,@6 ] ];
        NSArray *b = @[ @[ @2,@4,@6,@7 ], @[ @8,@2,@3,@5 ], @[ @2,@3,@7,@5 ], @[ @9,@3,@2,@6 ] ];
        
        NSMutableArray *answer = [[NSMutableArray alloc] init];
        
        NSInteger n = [[a objectAtIndex:0] count];
        NSInteger p = [[b objectAtIndex:0] count];
        NSInteger m = [a count];
        
        for (NSInteger i = 0; i < m; i++) {
            [answer addObject: [[NSMutableArray alloc] init]];
        }
        
        for (NSInteger i = 0; i < m; i++) {
            for (NSInteger j = 0; j < p; j++) {
                for (NSInteger k = 0; k < n; k++) {
                    NSInteger integerFromA = [[[a objectAtIndex:i]objectAtIndex:k]integerValue];
                    NSInteger integerFromB = [[[b objectAtIndex:k]objectAtIndex:j]integerValue];
                    
                    NSNumber *value = [NSNumber numberWithInteger:(integerFromA * integerFromB)];
                    
                    [[answer objectAtIndex:i] addObject:value];
                }
            }
        }
        
    NSLog(@"%@", answer);
        
    }
    return 0;
}

