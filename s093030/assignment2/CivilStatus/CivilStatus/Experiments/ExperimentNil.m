//
//  ExperimentNil.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "ExperimentNil.h"

@implementation ExperimentNil

-(void) run
{
    // As opposed to many languages
    // the following code will not
    // result in a compile or runtime error.
    NSObject *nothing = nil;
    NSLog(@"[ExperimentNil run]: %@", nothing.description);
}

@end
