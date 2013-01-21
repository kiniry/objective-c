/*************************************************************************
 *  File name   : mem_Test.m
 *  Description : Class for Memory Test
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "mem_Test.h"

@interface mem_Test ()

@property (readwrite, nonatomic, assign) NSMutableArray* test;

@end

@implementation mem_Test

@synthesize test = _test;

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
