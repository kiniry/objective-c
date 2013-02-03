//
//  ProcessBuilder.h
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProcessBuilder : NSObject
// properties
@property (nonatomic) NSArray *command;
@property (nonatomic) NSString *directory;
@property (nonatomic) NSDictionary *environment;
@property BOOL redirectErrorStream;

// designated initializer
-(id)initWithCommandStringArray:(NSArray *)commandArray;
// another initializer
-(id)initWithCommandStrings:(NSString *)firstCommand, ... NS_REQUIRES_NIL_TERMINATION;

// nil-terminated command list setter
-(void)setCommands:(NSString *)firstCommand, ... NS_REQUIRES_NIL_TERMINATION;

@end
