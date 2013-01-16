//
//  FooProtocol.h
//  CivilStatus
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//
#import "ExperimentProtocol.h"

#ifndef CivilStatus_FooProtocol_h
#define CivilStatus_FooProtocol_h

@protocol Foo<NSObject>
-(void)doSomething;
@optional
// Everything here is optional
-(void)doSomethingOptional;
@required
-(void)doSomethingRequired;
// Everything here is required
@property (nonatomic, strong) NSString *fooProp;
@end

#endif
