//
//  main.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProcessBuilder.h"
#import "Process.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // create a process builder that executes echo with two arguments
        ProcessBuilder *processBuilder = [[ProcessBuilder alloc]initWithCommandStrings:@"/bin/echo", @"testing", @"now", nil];
        
        // combine stderr and stdin into one output pipe
        [processBuilder setRedirectErrorStream:YES];
        
        // create a process from the process builder
        Process *process = [[Process alloc]initWithProcessBuilder:processBuilder];
        
        // start the process
        [process start];
        
        // block the execution until the process finishes and get the exit code
        int exitStatus = [process waitFor];
        
        // get the process output stream and read
        NSData *data = [[process getOutputStream] readDataToEndOfFile];
        
        // convert to a NSString
        NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"The process exited with exit code: %d, and wrote the following to stdout: %@", exitStatus, output);
        
    }
    return 0;
}

