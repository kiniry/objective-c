//
//  BlockTest.h
//  Assignment2-2
//
//  Created by Markus Færevaag on 16.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SimpleBlockWithArg)(NSString*);

@interface BlockTest : NSObject

-(void) runSomeBlockWithMsg: (NSString *)msg;
-(void) runSomeBlocksThreaded;

@end
