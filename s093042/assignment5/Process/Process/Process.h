//
//  Process.h
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProcessBuilder.h"

@interface Process : NSObject
// property to hold process builder
@property ProcessBuilder *processBuilder;

// designated initializer
-(id)initWithProcessBuilder:(ProcessBuilder *)aProcessBuilder;

// start a process
-(void)start;
// kill the process
-(void)destroy;
// get the exit code
-(int)exitValue;
// get stderr
-(NSFileHandle *)getErrorStream;
// get stdin
-(NSFileHandle *)getInputStream;
// get gtdout
-(NSFileHandle *)getOutputStream;
// block execution until process finishes and get exit code
-(int)waitFor;

@end
