//
//  BONEngineer.m
//  BONCITIZEN
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/22/13.
//  Copyright (c) 2013 Bastian Buch, s113432, and Jacob Gjerstrup, s113440. All rights reserved.
//

#import "BONEngineer.h"

@implementation BONEngineer
@synthesize workDone = _workDone;


// The function "trustMeIAmAnEngineer" from the engineer header file is
// defined, along with the "work" and "workIsDOne" functions from the
// CEO protocol. These are implemented because the engineer follows the
// "GetWorkDone" protocol as defined in the CEO class.

- (bool) trustMeIAmAnEngineer{
    return YES;
}

- (bool) workIsDone{
    NSError *WorkNotDone;
    if (!self.workDone){
        NSLog(@"Operation failed with error %@", WorkNotDone);
        return NO;
    } else {
        return YES;
    }	
}

- (id) work{
    NSString *work = @"Bullshit";
    _workDone = YES;
    return work;
}

@end
