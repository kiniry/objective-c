//
//  main.m
//  string-manipulation
//
//  Created by Anders Emil Nielsen on 23/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // --------------------------------------------------
        // Testing string manipulation
        // --------------------------------------------------
        
        // String appending
        static int iterations      = 1000000;
        static int maxStringLength = 10000;
        
        NSDate *start;
        
        for (int stringLength = 100; stringLength < maxStringLength; stringLength = stringLength*2) {
            
            // Appending
            NSMutableString *appendOffer = [@"" mutableCopy];
            
            start = [NSDate date];
            for (int j = 0; j < iterations; j++) {
                [appendOffer appendString:@"A"];
                if (j > stringLength) appendOffer = [@"" mutableCopy];
            }
            NSLog(@"Appending: %d", [[NSDate date] timeIntervalSinceDate:start]);
            
            // Creating string template of length maxStringLength
            NSMutableString *maxStringTemplate = [@"" mutableCopy];
            for (int j = 0; j < stringLength; j++) [maxStringTemplate stringByAppendingString:@"A"];
            
            // Removing
            NSMutableString *removeOffer = [NSMutableString stringWithString:maxStringTemplate];
            NSRange firstChar = NSMakeRange(0, 1);
            start = [NSDate date];
            for (int j = 0; j < iterations; j++) {
                [removeOffer replaceCharactersInRange:firstChar withString:@""];
                if (j > stringLength) removeOffer = [NSMutableString stringWithString:maxStringTemplate];
            }
            NSLog(@"Remove: %d", [[NSDate date] timeIntervalSinceDate:start]);
            
            // Findin substrings
            NSMutableString *substringOffer = [NSMutableString stringWithString:maxStringTemplate];
            
            start = [NSDate date];
            for (int j = 0; j < iterations; j++) {
                [substringOffer substringToIndex:j];
            }
            NSLog(@"Substring: %d", [[NSDate date] timeIntervalSinceDate:start]);
        }
        
        
        
    }
    return 0;
}

