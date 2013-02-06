/*************************************************************************
 *  File name   : Parent.m
 *  Description : Test Class Parent
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Parent.h"

@implementation Parent

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

-(void)helloWorld
{
    NSLog(@"Hello World!");
}

@end
