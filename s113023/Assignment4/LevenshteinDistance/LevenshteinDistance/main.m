//
//  main.m
//  LevenshteinDistance
//
//  Created by Andreas Haure on 21/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...
        NSString *stringOne = @"Jatak";
        NSString *stringTwo = @"Hej";
        int distance = [LevenshteinDistance distanceFromString:stringOne toString:stringTwo];
        NSLog(@"The Levenshtein distance between the two strings '%@' and '%@' are: %d",stringOne,stringTwo,distance);
        
    }
    return 0;
}

