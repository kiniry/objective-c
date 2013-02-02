
//
//  Process.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Process.h"

@interface Process ()
@property (nonatomic) NSTask *task;
@property NSPipe *errPipe;
@property NSPipe *inPipe;
@property NSPipe *outPipe;
@end

@implementation Process

-(NSTask *)task
{
    if(!_task)
    {
        if(self.processBuilder)
        {
            _task = [[NSTask alloc]init];
            
            NSString *launchPath = @"";
            NSMutableArray *arguments = [[NSMutableArray alloc] init];
            int i = 0;
            for(NSString *command in self.processBuilder.command)
            {
                if(i == 0)
                {
                    launchPath = command;
                }
                else
                {
                    [arguments addObject:command];
                }
                i++;
            }
            
            [_task setLaunchPath:launchPath];
            [_task setArguments:[arguments copy]];
            [_task setCurrentDirectoryPath:self.processBuilder.directory];
            [_task setEnvironment:self.processBuilder.enviroment];
            
            self.errPipe = [NSPipe pipe];
            [_task setStandardError: self.errPipe];
            self.inPipe = [NSPipe pipe];
            [_task setStandardInput: self.inPipe];
            self.outPipe = [NSPipe pipe];
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
    return [self initWithProcessBuilder:nil];
}
-(id) initWithProcessBuilder:(ProcessBuilder *)aProcessBuilder
{
    self = [super self];
    if(self)
    {
        self.processBuilder = aProcessBuilder;
    }
    return self;
}

-(void) start
{
    [self.task launch];
}
-(void) destroy
{
    [self.task terminate];
}
-(int) exitValue
{
    return [self.task terminationStatus];
}
-(NSFileHandle *) getErrorStream
{
    return [self.errPipe fileHandleForReading];
}
-(NSFileHandle *) getInputStream
{
    return [self.inPipe fileHandleForWriting];
}
-(NSFileHandle *) getOutputStream
{
    return [self.outPipe fileHandleForReading];
}
-(int) waitFor
{
    [self.task waitUntilExit];
    return [self exitValue];
}

@end
