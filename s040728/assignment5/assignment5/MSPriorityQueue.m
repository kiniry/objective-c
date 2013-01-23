//
//  MSPriorityQueue.m
//  assignment5
//
//  Created by Magloire on 1/23/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "MSPriorityQueue.h"

@implementation MSPriorityQueue

@synthesize queue = _queue;
@synthesize comparator = _comparator;

-(id)init{
    /*
    NSComparator cmp = ^(id obj1, id obj2){
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult) NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult) NSOrderedAscending;
        }
        return (NSComparisonResult) NSOrderedSame;
    };*/
    return [self initWithComparator:Nil];
}

-(id)initWithComparator:(NSComparator)comparator{
    self = [super init];
    if(self){
        _queue = [NSMutableArray init];
        _comparator = comparator;
    }
    return self;
}

-(BOOL)remove:(MSElement *)element{
    NSUInteger index = [self.queue indexOfObject:element];
    if(!index) return NO;
    [self.queue removeObjectAtIndex:index];
    return YES;
}

-(BOOL)contains:(MSElement *)element{
    return[self.queue containsObject:element];
}

-(int)size{
    return [self.queue count];
}

-(NSMutableArray *)toArray{
    return [self.queue copy];
}

-(MSElement *) peek{
    return [self.queue objectAtIndex:0];
}

-(MSElement *) poll{
    MSElement *tmp = [self peek];
    [self.queue removeObjectAtIndex:0];
    return tmp;
}

-(NSEnumerator *) iterator{
    return [self.queue objectEnumerator];
}

-(BOOL) add:(MSElement *)element{
    [self.queue addObject:element];
    if (self.comparator) {
        [self.queue sortUsingComparator:self.comparator];
    }else{
        [self.queue sortUsingSelector:@selector(compare:)];
    }

    return YES;
}
@end
