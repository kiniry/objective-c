//
//  ControllerForProtocolExperiment.m
//  Assignment#2
//
//  Created by Jacob Espersen on 17/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "ControllerForProtocolExperiment.h"

@implementation ControllerForProtocolExperiment

/*
 FunWithProtocols can access this method because it is
 defined in the protocol
 */
- (void)doSomethingWithBlock:(void (^)(void))block{
    block();
}

/*
 FunWithProtocols can not access this method because it is
 not defined in the protocol
 */
- (void)doSomethingElse{
    NSLog(@"Doing something different");
}

- (id)init{
    self = [super init];
    if (self) {
        self.protFun = [[FunWithProtocols alloc] init];
        [self.protFun setDelegate:self];
    }
    return  self;
}

@end
