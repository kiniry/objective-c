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
        NSUInteger lengthOfStrings = 7;
        
        if(argc > 1)
            lengthOfStrings = atoi(argv[1]);
        
        // make random string
        NSMutableString *mStr1 = [NSMutableString string];
        NSMutableString *mStr2 = [NSMutableString string];
        for(NSUInteger i = 0; i < lengthOfStrings; i++)
        {
            char c1 = 65 + arc4random_uniform(90-65);  // get a character between A-Z
            char c2 = 65 + arc4random_uniform(90-65);
            [mStr1 appendString:[NSString stringWithFormat:@"%c", c1]];
            [mStr2 appendString:[NSString stringWithFormat:@"%c", c2]];
        }
        
        NSString *str1 = [mStr1 copy];
        NSString *str2 = [mStr2 copy];
        
        // start the timer
        NSDate *start = [NSDate date];
        int dist = [LevenshteinDistance distanceBetween:str1 And:str2];
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // give the result
        NSLog(@"The Levenshtein distance between %@ and %@ is %d. And finding it took %f ms", str1, str2, dist, (timeInterval*-1000));
    }
    return 0;
}

