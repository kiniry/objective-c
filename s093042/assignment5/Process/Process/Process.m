//
//  Process.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Process.h"

@interface Process()
@property NSTask *task;

@end

@implementation Process
-(void)destroy
{
    [self.task terminate];
}
-(int)exitValue
{
    return [self.task terminationStatus];
}
-(NSPipe *)getErrorStream
{
    return [self.task standardError];
}
-(NSPipe *)getInputStream
{
    return [self.task standardInput];
}
-(NSPipe *)getOutputStream
{
    return [self.task standardOutput];
}
-(int)waitFor
{
    [self.task waitUntilExit];
    return [self exitValue];
}

@end
