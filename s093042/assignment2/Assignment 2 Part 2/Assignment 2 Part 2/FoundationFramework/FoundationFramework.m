//
//  FoundationFramework.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "FoundationFramework.h"

@implementation FoundationFramework

+(void)runExperiments {
    // The Foundation Framework include many of the classes that a developer would use, and these objects have most of the commonly used methods.
    
    // An example is the NSString class
    NSString *aString = @"A test string";
    // With this string we can do many operations that are commonly used on strings like, formatting a string:
    NSString *anotherString = [NSString stringWithFormat:@"The previous string defined was: %@, and here is a number: %d", aString, 12];
    // Or concatenating two strings:
    NSString *aThirdString = [anotherString stringByAppendingString:@" This is a concatenated string."];
    // Or replace occurences in a string:
    NSString *aFourthString = [aThirdString stringByReplacingOccurrencesOfString:@"test" withString:@"awesome"];
    // Almost all classes in the Fodundation framework includes the implementation of the description method, which we can call, and print it to the log by:
    NSLog(@"%@",aFourthString);
    
    // The Foundation framework has lots of other classes e.g. for creating arrays of objects:
    NSArray *anArray = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", nil];
    // And these objects has predefined methods as well, which e.g. can find the first occurence of a common object in another array:
    NSString *theFirstCommonObject = [anArray firstObjectCommonWithArray:[[NSArray alloc] initWithObjects:@"two", @"three", @"four", nil]];

    NSLog(@"The first common object is %@", theFirstCommonObject);
    

    // The most inmportant class in the Foundation framework is the NSObject which all other classes inherents from.
}@end
