//
//  main.m
//  LevenshteinDistance
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSString *str1 = @"foundation";
        NSString *str2 = @"foundations";
        
        int dist = [LevenshteinDistance distanceBetween:str1 And:str2];
        
        NSLog(@"The Levenshtein distance between %@ and %@ is %d.", str1, str2, dist);
    }
    return 0;
}

