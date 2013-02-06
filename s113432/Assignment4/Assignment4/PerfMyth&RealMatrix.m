//
//  PerfMyth&RealMatrix.m
//  Assignment4
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/23/13.
//  Copyright (c) 2013 Bastian Buch, s113432 and Jacob Gjerstrup, s113440. All rights reserved.

#import "PerfMyth&RealMatrix.h"

@implementation PerfMyth_RealMatrix
- (NSMutableArray*)multiplication:(NSMutableArray*)firstArray : (NSMutableArray*)secondArray{
    NSLog(@"Call to Multiplication initiated.");
    NSMutableArray* answer = [[NSMutableArray alloc]init];
    if ((firstArray.count == 0)||(secondArray.count == 0)) return answer;
    int firstArrayColumn = firstArray.count;
    int firstArrayRow = [[firstArray objectAtIndex:0] count];
    int secondArrayRow = [[secondArray objectAtIndex:0] count];
    for (int i = 0; i < firstArrayColumn; i++){
        NSMutableArray*row = [[NSMutableArray alloc]init];
        [answer insertObject:(NSMutableArray*)row atIndex:i];
        for (int j = 0; j < secondArrayRow; j++){
            int number = 0;
            for (int k = 0; k < firstArrayRow; k++){
                number += ([[[firstArray objectAtIndex:i] objectAtIndex:k] intValue] * [[[secondArray objectAtIndex:k] objectAtIndex:j] intValue]);
                }
            [[answer objectAtIndex:i]insertObject:[NSNumber numberWithInteger: number] atIndex:j ];
            number = 0;
            }
        }
    return answer;
    }

@end
