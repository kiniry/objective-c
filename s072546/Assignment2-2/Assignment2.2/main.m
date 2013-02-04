//
//  main.m
//  Assignment2.2
//
//  Created by Kim Gad Thomsen on 2/3/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExampleDownloaderDelegate.h"
#import "OverloadExample.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        /**
         * Foundation Framemework Tests
         *
         * The following lines of coded are designed to try different elements of the Foundation framework
         * and try to compare and reveil any differences there might be, compared to Java.
         */
        
        // - Starting with NSArray -
        NSArray *array = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
        
        //NSArray objects are immutable so it is not possible to insert another element so only read is possible
        NSLog(@"This is the second object i the array: %@", [array objectAtIndex:1]);
        
        //NSArray have some built-in methods for searching through the elements like this enumeration which takes a block
        //and calls that block for each element.
        [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"Object at index: %lu : %@", (unsigned long)idx, obj);
        }];
        
        //NSArray also gives the possibility of checking if an object is contained withou manually doing so
        NSLog(@"Does the array contain \"A\"? %d (1 for YES and 0 for NO)", [array containsObject:@"A"]);
        
        /**
         * Foundation framework also gives the possibility of retrieving data from the internet like this
         */
        //ExampleDownloaderDelegate is a class I've made to handle the delegate calls from the NSURLConnection
        ExampleDownloaderDelegate __strong *exampleDelegate = [[ExampleDownloaderDelegate alloc] init];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.dk"]];
        (void) [NSURLConnection connectionWithRequest:request delegate:exampleDelegate];
        
        //This must be here to stop the application from quitting before the request is responded and done.
        while (!exampleDelegate.done) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        //---------------------------------------------------------------------------------------------------
        
        /**
         * Overloading methods
         *
         * To show how this works a class have been created "OverloadExample"
         */
         //SEE THE "OverloadExample" CLASS

        //---------------------------------------------------------------------------------------------------
        
        /**
         * The alloc/init pattern in objective-c
         */
        //Initializing an object looks like this in obj-c
        
        ExampleDownloaderDelegate *del = [[ExampleDownloaderDelegate alloc] init];
        
        //Equivalent in Java would be ExampleDownloaderDelegate del = new ExampleDownloaderDelegate();
        //This pattern also gives the opportunity to make the initialization of an object contain some data
        //This could look like this:

        /**
         * [[ExampleDownloaderDelegate alloc] initWithPicture: pic];
         * In Java this might look something like this: new ExampleDownloaderDelegate(pic);
         */

        //---------------------------------------------------------------------------------------------------

        /**
         * Protocols in Objective-C
         * "ProtocolTest" class has been created to show how a class would implement a protocol. This class is implementing a protocol
         * called ExampleProtocol which contains two required method. A protocol can also have optional methods.
         *
         * The idea of protcols is to have some kind of method to define a set of functions regardless of a class. This means that as an example
         * when implementing the NSURLConnection ealier the delegate class has to implement a set of methods defined in that NSURLDataDelega protocol.
         */
        
        //---------------------------------------------------------------------------------------------------
        
        /**
         * Blocks in Objective-C
         */
        //Blocks in objective-c is some code which can be send around through the application as a normal variable. A block can have parameters so it can be sent arguments when used. An example is the enumaration of an array ealier in this file which uses a block to handle each enumerated element.
        
        
    }
    return 0;
}

