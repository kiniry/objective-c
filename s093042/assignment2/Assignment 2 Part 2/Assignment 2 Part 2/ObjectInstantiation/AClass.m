//
//  AClass.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "AClass.h"

@implementation AClass

@synthesize aProperty = _aProperty;

// In Objective-C one can have multiple "constructors", these are called initializers, the default initializer taht comes from NSObject is the 'init', this can be overridden, like:
-(id)init {
    // all this initializer does is call the designated initializer:
    return [self initWithParameter:@"This string came from the initializer 'init'."];
}

-(id)initWithParameter:(NSString *)aParameter {
    // this is the designated initializer, since this is the initializer that calls the super's 'init'.
    self = [super init];
    if(self){
        self.aProperty = [aParameter stringByAppendingString:@" This string was set using the designated initializer."];
    }
    
    return self;
}


// this is ''method'' is the toString equivalent, from C# and Java.
-(NSString *)description {
    return [NSString stringWithFormat:@"The contents of aProperty is: %@", self.aProperty];
}

@end
