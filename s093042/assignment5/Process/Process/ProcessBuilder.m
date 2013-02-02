//
//  ProcessBuilder.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "ProcessBuilder.h"

@implementation ProcessBuilder

-(NSString *)directory
{
    if(!_directory)
    {
        // if directory is not set, use the working directory given for this application
        _directory = [[[NSFileManager alloc] init] currentDirectoryPath];
    }
    return _directory;
}

-(NSDictionary *)enviroment
{
    if(!_enviroment)
    {
        // if no enviroment is set use, the enviroment used to execute this application
        _enviroment = [[NSProcessInfo processInfo] environment];
    }
    return _enviroment;
}

-(id)init
{
    return [self initWithCommandStringArray:nil];
}

-(id)initWithCommandStringArray:(NSArray *)commandArray
{
    self = [super init];
    if(self)
    {
        _command = commandArray;
    }
    return self;
}
-(id)initWithCommandStrings:(NSString *)firstCommand, ...
{
    va_list commands;
    va_start(commands, firstCommand);
    
    NSMutableArray *commandArray = [[NSMutableArray alloc] init];
    
    for (NSString *command = firstCommand; command != nil; command = va_arg(commands, NSString*))
    {
        [commandArray addObject:command];
    }
    
    va_end(commands);
    
    return [self initWithCommandStringArray:[commandArray copy]];
}

-(void)setCommands:(NSString *)firstCommand, ...
{
    va_list commands;
    va_start(commands, firstCommand);
    
    NSMutableArray *commandArray = [[NSMutableArray alloc] init];
    
    for (NSString *command = firstCommand; command != nil; command = va_arg(commands, NSString*))
    {
        [commandArray addObject:command];
    }
    
    va_end(commands);
    
    _command = [commandArray copy];
}

@end
