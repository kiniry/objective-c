//
//  BONEngineer.m
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/22/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONEngineer.h"

@implementation BONEngineer
@synthesize workDone = _workDone;

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
