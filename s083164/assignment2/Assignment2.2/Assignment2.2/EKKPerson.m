//
//  EKKPerson.m
//  Assignment2.2
//
//  Created by Emil Klarskov Kristensen on 1/19/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "EKKPerson.h"

@implementation EKKPerson

-(EKKPerson *)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        _name = name;
    }
    
    return self;
}

@end
