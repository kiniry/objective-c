//
//  ExperimentProtocol.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "ExperimentProtocol.h"
#import "FooProtocol.h"

@implementation ExperimentProtocol

@synthesize fooProp = _fooProp;

-(void) doSomething
{
    NSLog(@"[ExperimentProtocol doSomething]");
}

-(void) doSomethingRequired
{
    NSLog(@"[ExperimentProtocol doSomethingRequired]");
}

@end
