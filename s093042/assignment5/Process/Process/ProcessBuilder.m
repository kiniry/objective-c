//
//  ProcessBuilder.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "ProcessBuilder.h"

@implementation ProcessBuilder
// directory property getter
-(NSString *)directory
{
    if(!_directory)
    {
        // if directory is not set, use the working directory given for this application
        _directory = [[[NSFileManager alloc] init] currentDirectoryPath];
    }
    return _directory;
}

// enviroment property getter
-(NSDictionary *)environment
{
    if(!_environment)
    {
        // if no enviroment is set use, the enviroment used to execute this application
        _environment = [[NSProcessInfo processInfo] environment];
    }
    return _environment;
}

-(id)init
{
    // not used to much unless the command array is filled after the call to init
    return [self initWithCommandStringArray:nil];
}

-(id)initWithCommandStringArray:(NSArray *)commandArray
{
    self = [super init];
    if(self)
    {
        // set the command array
        _command = commandArray;
    }
    return self;
}
-(id)initWithCommandStrings:(NSString *)firstCommand, ...
{
    // make a variable list pointer
    va_list commands;
    va_start(commands, firstCommand);
    
    NSMutableArray *commandArray = [[NSMutableArray alloc] init];
    
    // and add each element to the mutable array
    for (NSString *command = firstCommand; command != nil; command = va_arg(commands, NSString*))
    {
        [commandArray addObject:command];
    }
    
    va_end(commands);
    
    // return using the designated initializer
    return [self initWithCommandStringArray:[commandArray copy]];
}

// command property setter using list of strings
-(void)setCommands:(NSString *)firstCommand, ...
{
    // make a variable list pointer
    va_list commands;
    va_start(commands, firstCommand);
    
    NSMutableArray *commandArray = [[NSMutableArray alloc] init];
    
    // and add each element to the mutable array
    for (NSString *command = firstCommand; command != nil; command = va_arg(commands, NSString*))
    {
        [commandArray addObject:command];
    }
    
    va_end(commands);
    
    // set the command property with a immutable copy of the array
    _command = [commandArray copy];
}

@end
