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
        
        
        //Allocate two matrix's
        NSArray *matrix1Row1 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row2 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row3 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row4 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row5 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row6 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row7 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix1Row8 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        
        NSArray *matrix2Row1 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row2 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row3 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row4 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row5 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row6 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row7 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        NSArray *matrix2Row8 = @[ @2,@4,@6,@7,@2,@4,@6,@7 ];
        
        NSArray *a = @[ matrix1Row1, matrix1Row2, matrix1Row3, matrix1Row4, matrix1Row5, matrix1Row6, matrix1Row7, matrix1Row8 ];
        NSArray *b = @[ matrix2Row1, matrix2Row2, matrix2Row3, matrix2Row4, matrix2Row5, matrix2Row6, matrix2Row7, matrix2Row8 ];
        
        //The result of the multiplication will be stored in the answer
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

