//
//  AFactoryClass.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "AFactoryClass.h"

@implementation AFactoryClass

// Factories handles both the allocation of memory and the initialization of the instance, these factory methods are class methods.
+(id)aFactoryClassWithAParameterSet {
    return [[AFactoryClass alloc] initWithParameter:@"This parameter was set using the factory!"];
}

// A class have many different factories
+(id)aFactoryClassWithNoParameterSet {
    return [[AFactoryClass alloc] init];
}

// Since we had inherented from AClass from the ObjectInstantiation experiments, we would like to make it clear that these objects are from the AFactoryClass class, so we override the description.
-(NSString *)description {
    return [@"This is an object from the AFactoryClass class. " stringByAppendingString:[super description]];
}
@end
