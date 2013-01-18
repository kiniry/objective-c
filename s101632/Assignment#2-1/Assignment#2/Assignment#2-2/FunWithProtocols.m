//
//  FunWithProtocols.m
//  Assignment#2
//
//  Created by Jacob Espersen on 17/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "FunWithProtocols.h"



@implementation FunWithProtocols

- (void)useDelegate{
    [self.delegate doSomething];
    //[self.delegate doSomethingElse]; This is not possible because we can only access the methods in the controller that is defined in the protocol
}

@end
