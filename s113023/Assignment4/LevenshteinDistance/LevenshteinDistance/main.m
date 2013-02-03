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
        
        // Create char arrays to save user input strings into
        char stringOneCharArray[500];
        char stringTwoCharArray[500];
    
        // Get strings to test on from console
        NSLog(@"Enter first String (max 500 chars): ");
        scanf("%s",stringOneCharArray);
        
        NSLog(@"Enter second String (max 500 chars): ");
        scanf("%s",stringTwoCharArray);
        
        // Create NSString objects from char arrays:
        NSString *stringOne = [[NSString alloc] initWithCString: stringOneCharArray encoding: NSUTF8StringEncoding];
        NSString *stringTwo = [[NSString alloc] initWithCString: stringTwoCharArray encoding: NSUTF8StringEncoding];
        
        //NSString *stringOne = @"A";
        //NSString *stringTwo = @"B";
        
        NSLog(@"Levenshtein Distance calculation started");
        NSDate *start = [NSDate date];
        int distance = [LevenshteinDistance distanceFromString:stringOne toString:stringTwo];
        NSLog(@"The Levenshtein distance between the two strings '%@' and '%@' are: %d",stringOne,stringTwo,distance);
        double timePassed = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Levenshtein Distance calculation finished");
        
        NSLog(@"The Levenshtein Distance calculation took %f seconds",timePassed);
        
    }
    return 0;
}

