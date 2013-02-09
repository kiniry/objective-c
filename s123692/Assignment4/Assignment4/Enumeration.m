//
//  Enumeration.m
//  Assignment4
//
//  Created by Markus Færevaag on 24.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Enumeration.h"

@implementation Enumeration

@synthesize array           = _array;
@synthesize limit           = _limit;
@synthesize currentNumber   = _currentNumber;

-(id) initWithLimit:(int)limit
{
    self = [super init];
    if (self)
    {
        _limit = limit;
        
        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        for (int i = 0; i < self.limit; i++) {
            [tmp addObject:[NSNumber numberWithInt:i]];
        }
        _array = [[NSArray alloc] initWithArray:[tmp copy]];
    }
    return self;
}

-(void) classicIteration
{
    for (int i = 0; i < self.limit; i++) {
        self.currentNumber = [self.array objectAtIndex:i];
    }
}

-(void) classicEnumeration
{
	NSEnumerator *enumerator = [self.array objectEnumerator];
    
    NSNumber *i;
	while ((i = [enumerator nextObject]) != nil) {
		self.currentNumber = i;
	}
}

-(void) fastEnumeration
{
    for (id i in self.array)
    {
        self.currentNumber = i;
    }
}

@end
