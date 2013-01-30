//
//  PriorityQueue.m
//  Assignment#5
//
//  Created by Jacob Espersen on 28/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "PriorityQueue.h"

@interface PriorityQueue()

- (int)findIndexOfObject:(id)obj;

@end


@implementation PriorityQueue

/*
 Initializes the PriorityQueue with a default comarator
 */
- (id)init{
    self = [super init];
    if (self) {
        self.pQueue = [[NSMutableArray alloc] init];
        self.comperator = ^(id obj1, id obj2){
            if (obj1 > obj2) {
                return NSOrderedDescending;
            }else if(obj1 < obj2){
                return NSOrderedAscending;
            }else{
                return NSOrderedSame;
            }
        };
    }
    return self;
}

/*
 Initializes the PriorityQueue with custom comparator
 */
-(id)initWithComperator:(NSComparator)comp{
    self = [super init];
    if (self) {
        self.pQueue = [[NSMutableArray alloc] init];
        self.comperator = comp;
    }
    return self;
}



/*
 Adds a object to the queue and sorts the queue by the priority set by the comparator.
 */
- (BOOL)add:(id)object{
    NSAssert(object != nil, @"The object you want to enqueue can not be nil");
    [self.pQueue addObject:object];
    [self.pQueue sortUsingComparator:self.comperator];
    return YES;
    
}

/*
 returns the the object with the highest priority
 */
- (id)peek{
    NSAssert(![self isEmpty],@"The PriorityQueue is empty!");
    return [self.pQueue objectAtIndex:0];
}

/*
 Returns and removes the object with the highest priority
 */
-(id)poll{
    NSAssert(![self isEmpty],@"The PriorityQueue is empty!");
    id obj = [self peek];
    [self.pQueue removeObjectAtIndex:0];
    self.size--;
    return obj;
}
/*
 Finds the index of the object intented for removal and removes it if it exist
 */
- (BOOL)remove:(id)object{
    NSAssert(object != nil, @"The Priorityqueue can not contain nil");
    int rIndex = [self findIndexOfObject:object];
    //NSAssert(rIndex != -1, @"The priorityqueue does not contain that object");
    [self.pQueue removeObjectAtIndex:rIndex];
    self.size--;
    return YES;
    
}

/*
 Clears the mutable array
 */
- (void)clear{
    NSAssert(![self isEmpty],@"The PriorityQueue is empty!");
    [self.pQueue removeAllObjects];
    self.size = 0;
}

/*
 Checks if the mutable array contains a object
 */
- (BOOL)contains:(id)object{
    NSAssert(![self isEmpty],@"The PriorityQueue is empty!");
    return [self.pQueue containsObject:object];
}

/*
 Returns the priorityqueue as a array
 */
- (NSArray*)toArray{
    return [[NSArray alloc] initWithArray:self.pQueue];
}

/*
 Goes through all elements in the array and if the array contains the object it will return its index
 otherwise it will return -1
 */
- (int)findIndexOfObject:()obj{
    NSAssert(![self isEmpty],@"The PriorityQueue is empty!");
    return [self.pQueue indexOfObject:obj];
}

/*
 returns the queue as a enumerator
 */
- (NSEnumerator*)iterator{
    return [self.pQueue objectEnumerator];
}

/*
 Checks and returns if the queue is empty
 */
- (BOOL)isEmpty{
    if (self.size == 0) return YES;
    else return NO;
}






@end
