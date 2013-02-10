//
//  main.m
//  StringManipulation
//
//  Created by Emil Klarskov Kristensen on 2/10/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSInteger numberOfIterations = 100000;
        
        NSDate *time;
        double done;
        
        NSMutableString *appendUsingString;
        NSMutableString *appendUsingFormat;
        NSMutableString *capacityString;
        
        for (int j = 0; j < 5; j++) {
            
            
            // ----APPENDING----
            //Appending using appendString
            appendUsingString = [NSMutableString string];
            time = [NSDate date];
            for (int i = 0; i < numberOfIterations; i++) {
                if (i == numberOfIterations/2) {
                    [appendUsingString appendString:@"WhereisWally?"];
                }
                if (i%2==0) {
                    [appendUsingString appendString:@"H"];
                }else{
                    [appendUsingString appendString:@"A"];
                }
            }
            done = [[NSDate date] timeIntervalSinceDate:time];
            NSLog(@"The appendString finished in %f", done);
        
            //Appending using appendFormat
            appendUsingFormat = [NSMutableString string];
            time = [NSDate date];
            for (int i = 0; i < numberOfIterations; i++) {
                if (i == numberOfIterations/2) {
                    [appendUsingFormat appendString:@"WhereisWally?"];
                }
                if (i%2==0) {
                    [appendUsingFormat appendFormat:@"H"];
                }else{
                    [appendUsingFormat appendFormat:@"A"];
                }
            }
            done = [[NSDate date] timeIntervalSinceDate:time];
            NSLog(@"The appendFormat finished in %f", done);
            
            //Append using a string with capacity
            capacityString = [NSMutableString stringWithCapacity:numberOfIterations];
            time = [NSDate date];
            for (int i = 0; i < numberOfIterations; i++) {
                if (i == numberOfIterations/2) {
                    [capacityString appendString:@"WhereisWally?"];
                }
                if (i%2==0) {
                    [capacityString appendString:@"H"];
                }else{
                    [capacityString appendString:@"A"];
                }
            }
            done = [[NSDate date] timeIntervalSinceDate:time];
            NSLog(@"Capacity string append finished in %f", done);
            
            // ----Replacing substrings----
            
            time = [NSDate date];
            [appendUsingString stringByReplacingOccurrencesOfString:@"WhereisWally?" withString:@"WallyWasFound"];
            done = [[NSDate date] timeIntervalSinceDate:time];
            NSLog(@"Finding the substring was done in %f", done);

        }
        
        
        
    }
    return 0;
}

