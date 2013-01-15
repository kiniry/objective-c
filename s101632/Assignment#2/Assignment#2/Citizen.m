//
//  Citizen.m
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (id)initWithFirstName:(NSString *)fName lastName:(NSString *)lName sex:(NSString *)sex age:(NSNumber *)age{
    
    self = [super init];
    
    if (self) {
        [self setFirstName:fName];
        [self setLastName:lName];
        [self setSex:sex];
        [self setAge:age];
    }
    return self;
}

@end
