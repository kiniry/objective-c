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
@property ProcessBuilder *processBuilder;

-(id)initWithProcessBuilder:(ProcessBuilder *)aProcessBuilder;

-(void) start;
-(void) destroy;
-(int) exitValue;
-(NSFileHandle *) getErrorStream;
-(NSFileHandle *) getInputStream;
-(NSFileHandle *) getOutputStream;
-(int) waitFor;

@end
