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
        
        // Enviroment check
        process = nil;
        
        // add an additional environment vairable to the default environment
        NSMutableDictionary *environment = [processBuilder.environment mutableCopy];
        [environment setObject:@"Testing" forKey:@"SOME_VAR"];
        processBuilder.environment = [environment copy];
        
        // execute printenv, to list all environment variables
        [processBuilder setCommands:@"/usr/bin/printenv", nil];
        
        // reallocate and reinitialize the process
        process = [[Process alloc] initWithProcessBuilder:processBuilder];
        
        // start the process
        [process start];
        
        // block the execution until the process finishes and get the exit code
        exitStatus = [process waitFor];
        
        // get the process output stream and read
        data = [[process getOutputStream] readDataToEndOfFile];
        
        // convert to a NSString
        output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"The process exited with exit code: %d, and wrote the following to stdout: %@", exitStatus, output);
        
        // Working directory check
        process = nil;
        
        // execute ls, to list the directory contents
        [processBuilder setCommands:@"/bin/ls", nil];
        
        // set the working directory
        [processBuilder setDirectory:@"/"];
        
        // reallocate and reinitialize the process
        process = [[Process alloc] initWithProcessBuilder:processBuilder];
        
        // start the process
        [process start];
        
        // block the execution until the process finishes and get the exit code
        exitStatus = [process waitFor];
        
        // get the process output stream and read
        data = [[process getOutputStream] readDataToEndOfFile];
        
        // convert to a NSString
        output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"The process exited with exit code: %d, and wrote the following to stdout: %@", exitStatus, output);

    }
    return 0;
}

