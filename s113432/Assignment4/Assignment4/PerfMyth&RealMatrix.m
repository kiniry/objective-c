//
//  PerfMyth&RealMatrix.m
//  Assignment4
//
//  Created by Bastian Buch on 1/23/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "PerfMyth&RealMatrix.h"

@end
@implementation PerfMyth_RealMatrix

- (NSMutableArray*)multiplication:(NSArray*)firstArray : (NSArray*)secondArray{
    NSArray* answerRows = [[NSArray alloc]init];
    NSArray* answerColumns = [[NSArray alloc]init];
    NSMutableArray* answer = [[NSMutableArray alloc]init];
    int firstArrayColumn = firstArray.count;
    int secondArrayColumn = secondArray.count;
    int firstArrayRow = [[firstArray objectAtIndex:0] count];
    int secondArrayRow = [[secondArray objectAtIndex:0] count];

    for (int i = 0; i < firstArrayColumn; i++){
        for (int j = 0; j < secondArrayRow; j++){
            for (int k = 0; k < firstArrayRow; k++){
                [[firstArray objectAtIndex:1]addObject:[NSNumber numberWithInteger: k]];
            }
        }
    }
    return answer;
}


@end
