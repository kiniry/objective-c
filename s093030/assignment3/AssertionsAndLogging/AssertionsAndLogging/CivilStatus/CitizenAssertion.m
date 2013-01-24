//
//  CitizenAssertion.m
//  AssertionsAndLogging
//
//  Created by Søren Olofsson on 1/17/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "CitizenAssertion.h"
#import "CitizenPrivate.h"

@implementation CitizenAssertion

-(BOOL) marry:(Citizen*) fiancee
{
    NSAssert([super canMarry:fiancee], @"marry precondition failure");
    return [super marry:fiancee];
}

-(BOOL) divorce
{
    NSAssert([super canDivorce], @"divorce precondition failure");
    return [super divorce];
}

-(Citizen *) giveBirthToSpecificSex:(BOOL) sex andNameChild:(NSString*) name
{
    NSAssert([super canGiveBirth], @"giveBirthToSpecificSex precondition failure");
    return [super giveBirthToSpecificSex:sex andNameChild:name];
}

@end
