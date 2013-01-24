//
//  CitizenLogging.m
//  AssertionsAndLogging
//
//  Created by Søren Olofsson on 1/17/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "CitizenLogging.h"
#import "CitizenPrivate.h"

@implementation CitizenLogging

-(BOOL) marry:(Citizen*) fiancee
{
    if(![super canMarry:fiancee])
    {
        NSLog(@"marry precondition failure");
        return false;
    }
    return [super marry:fiancee];
}

-(BOOL) divorce
{
    if(![super canDivorce])
    {
        NSLog(@"divorce precondition failure");
        return false;
    }
    return [super divorce];
}

-(Citizen *) giveBirthToSpecificSex:(BOOL) sex andNameChild:(NSString*) name
{
    if(![super canGiveBirth])
    {
        NSLog(@"giveBirthToSpecificSex precondition failure");
        return false;
    }
    return [super giveBirthToSpecificSex:sex andNameChild:name];
}

@end
