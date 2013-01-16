//
//  Model.m
//  assignment2-2
//
//  Created by Anders Emil Nielsen on 15/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "Model.h"

@interface Model()

@property NSNumber *hiddenField; // this field is private for this class

@end

@implementation Model

@synthesize foo = _foo; // Not necessary in xCode 4.4

- (Model *)initWithFoo:(NSString *)foo
{
    self = [super init];
    if (self) {
        self.foo = foo;
    }
    return self;
}

-(void)doSomething
{
    NSLog(@"Model here doing something");
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Model\nFoo: %@", self.foo];
}

@end
