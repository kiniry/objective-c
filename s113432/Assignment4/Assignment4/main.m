//
//  main.m
//  Assignment4
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/22/13.
//  Copyright (c) 2013 Bastian Buch and Jacob Gjerstrup, s113440. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PerfMyth_RealAppDelegate.h"
#import "PerfMyth&RealCalculateLevenshteinDistance.h"
#import "PerfMyth&RealMatrix.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
		// creates various strings for comparions, then calls the calculation method.
        NSString* sunshine = @"Sunshine";
        NSString* rainbows = @"Rainbows";
        NSString* cookie = @"Cookie";
        NSString* monster = @"Monster";
        NSString* poppins = @"Supercalifragilisticexpialidocious";
        NSMutableArray *firstArray = [[NSMutableArray alloc]init];
        NSMutableArray *secondArray = [[NSMutableArray alloc]init];
        NSMutableArray *fRow0 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow1 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow2 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow3 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow4 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow5 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow6 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow7 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow8 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *fRow9 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow0 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow1 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow2 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow3 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow4 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow5 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow6 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow7 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow8 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        NSMutableArray *sRow9 = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithInt:2] ,[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        [firstArray addObject:fRow0];
        [firstArray addObject:fRow1];
        [firstArray addObject:fRow2];
        [firstArray addObject:fRow3];
        [firstArray addObject:fRow4];
        [firstArray addObject:fRow5];
        [firstArray addObject:fRow6];
        [firstArray addObject:fRow7];
        [firstArray addObject:fRow8];
        [firstArray addObject:fRow9];
        [secondArray addObject:sRow0];
        [secondArray addObject:sRow1];
        [secondArray addObject:sRow2];
        [secondArray addObject:sRow3];
        [secondArray addObject:sRow4];
        [secondArray addObject:sRow5];
        [secondArray addObject:sRow6];
        [secondArray addObject:sRow7];
        [secondArray addObject:sRow8];
        [secondArray addObject:sRow9];
        //NSLog(@"The Levenshtein Distance of the two words is %d", [PerfMyth_RealCalculateLevenshteinDistance calculateLevenshteinDistance : @"Cookie" : @"Supercalifragilisticexpialidocious"]);
        NSMutableArray* answer = [[NSMutableArray alloc]init];
        answer = [PerfMyth_RealMatrix multiplication: firstArray: secondArray];
        for (int i = 0; i <answer.count; i++){
            int k = [[answer objectAtIndex:i] count];
            for (int j = 0; j < k; j++){
                NSLog(@"%d,%d has value %d",i,j,[[[answer objectAtIndex:i] objectAtIndex:j] intValue]);
            }
        }
    }
    return 0;
}
