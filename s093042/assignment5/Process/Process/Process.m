
//
//  Process.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Process.h"

@interface Process ()
// internal NSTask
@property (nonatomic) NSTask *task;

// internal pipes for standard I/O
@property NSPipe *errPipe;
@property NSPipe *inPipe;
@property NSPipe *outPipe;

@end

@implementation Process
// task property getter
-(NSTask *)task
{
    // lazy instantiation for internal task property
    if(!_task)
    {
        if(self.processBuilder)
        {
            // create a new NSTask if a process builder is defined
            _task = [[NSTask alloc]init];
            
            NSString *launchPath = @""; 
            NSMutableArray *arguments = [[NSMutableArray alloc] init];
            int i = 0;
            for(NSString *command in self.processBuilder.command)
            {
                if(i == 0)
                {
                    // the first element in command is a program
                    launchPath = command;
                }
                else
                {
                    // the rest is arguments
                    [arguments addObject:command];
                }
                i++;
            }
            
            // set the program to be launched
            [_task setLaunchPath:launchPath];
            // set the program arguments
            [_task setArguments:[arguments copy]];
            // set working directory
            [_task setCurrentDirectoryPath:self.processBuilder.directory];
            // set the environment
            [_task setEnvironment:self.processBuilder.environment];
            
            // create a new pipe for stderr and set it to the task
            self.errPipe = [NSPipe pipe];
            [_task setStandardError: self.errPipe];
            
            // create a new pipe for stdin and set it to the task
            self.inPipe = [NSPipe pipe];
            [_task setStandardInput: self.inPipe];
            
            // should stderr be redirected to stdout?
            if(self.processBuilder.redirectErrorStream)
            {
                // use the same pipe as stderr
                self.outPipe = self.errPipe;
            }
            else
            {
                // use a new pipe
                self.outPipe = [NSPipe pipe];
            }
            // and set the pipe to the task
            [_task setStandardOutput: self.outPipe];
        }
        else
        {
            NSLog(@"Error could not make internal process, without a process builder!");
        }
    }
    return _task;
}

-(id)init
{
    // not used for much, unless the process builder is set after the call to init
    return [self initWithProcessBuilder:nil];
}
-(id)initWithProcessBuilder:(ProcessBuilder *)aProcessBuilder
{
    self = [super self];
    if(self)
    {
        // set the process builder
        self.processBuilder = aProcessBuilder;
    }
    return self;
}

-(void)start
{
    // start the process
    [self.task launch];
}
-(void)destroy
{
    // kill the process
    [self.task terminate];
}
-(int)exitValue
{
    // get the exit code
    return [self.task terminationStatus];
}
-(NSFileHandle *)getErrorStream
{
    // get stderr
    return [self.errPipe fileHandleForReading];
}
-(NSFileHandle *)getInputStream
{
    // get stdin
    return [self.inPipe fileHandleForWriting];
}
-(NSFileHandle *)getOutputStream
{
    // get stdout
    return [self.outPipe fileHandleForReading];
}
-(int)waitFor
{
    // block execution until the process exits
    [self.task waitUntilExit];
    // and return the exit code
    return [self exitValue];
}

@end
