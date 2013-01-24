//
//  CitizenDefensive.m
//  AssertionsAndLogging
//
//  Created by Søren Olofsson on 1/17/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "CitizenDefensive.h"
#import "CitizenPrivate.h"

@implementation CitizenDefensive

-(BOOL) marry:(Citizen*) fiancee
{
    if(![super canMarry:fiancee])
    {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"marry precondition failure"]
                                     userInfo:nil];
    }
    return [super marry:fiancee];
}

-(BOOL) divorce
{
    if(![super canDivorce])
    {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"divorce precondition failure"]
                                     userInfo:nil];
    }
    return [super divorce];
}

-(Citizen *) giveBirthToSpecificSex:(BOOL) sex andNameChild:(NSString*) name
{
    if(![super canGiveBirth])
    {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"giveBirthToSpecificSex precondition failure"]
                                     userInfo:nil];
    }
    return [super giveBirthToSpecificSex:sex andNameChild:name];
}

@end
