/*************************************************************************
 *  File name   : Citizen.m
 *  Description : Class for citizens
 *
 *  Created on  : 15/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Citizen.h"

@interface Citizen ()

@property (readwrite, nonatomic, assign) NSMutableArray* children;
@property (readwrite, nonatomic, assign) Citizen* mother;
@property (readwrite, nonatomic, assign) Citizen* father;

@end

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize mother = _mother;
@synthesize father = _father;

- (id) initWithName:(NSString*)name withSex:(NSString*)sex withAge:(NSNumber*)age
{
    self = [super init];
    if (self)
    {
        _name = name;
        _sex = sex;
        _age = age;
        _children = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
