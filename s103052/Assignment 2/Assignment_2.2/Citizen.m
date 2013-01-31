/*************************************************************************
 *  File name   : Citizen.m
 *  Description : Test Class Citizen
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Citizen.h"

@interface Citizen ()

@end

@implementation Citizen

@synthesize name = _name;

- (id) initWithName:(NSString*)newName
{
    self = [super init];
    if (self)
    {
        _name = newName;
    }
    return self;
}

- (NSString*)getCitizenName
{
    return self.name;
}

@end
