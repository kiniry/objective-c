//
//  main.m
//  StringManipulation
//
//  Created by Jacob Espersen on 24/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    #define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

    @autoreleasepool {
        /*
         I have made a where we first append 5000 char's to a mutable string, and then remove it, Then each time there has been
         appended and removed characters I will do the same again and double the characters to be appendet and removed.
         */
        NSMutableString* str = [[NSMutableString alloc] init];
        int iterations = 100000;
        NSDate *timestamp;
        for (int j = 0; j<= 10; j++) {
            timestamp = [NSDate date];
            NSLog(@"Beginning to append char's to string");
            for (int i = 0; i <= iterations; i++) {
                [str appendFormat:@"x"];
            }
            NSLog(@"Finished appending char's to string time passed: %f",([timestamp timeIntervalSinceNow]*-1000));
            
            timestamp = [NSDate date];
            [str uppercaseString];
            NSLog(@"Finished converting to uppercase time passed: %f, Now we will remove the char's",([timestamp timeIntervalSinceNow]*-1000));
            
            timestamp = [NSDate date];
            for (int i = 0; i <= iterations; i++) {
                [str deleteCharactersInRange:NSMakeRange([str length]-1, 1)];
            }
            NSLog(@"Finished removing the chars time passed: %f, now we will double the iterations",([timestamp timeIntervalSinceNow]*-1000));
            iterations *= 2;
        }
        
        
        iterations = 100000;
        for (int i = 0; i <= iterations; i++) {
            [str appendFormat:@"x"];
        }
        timestamp = [NSDate date];
        [str uppercaseString];
        




    }
    return 0;
}

