//
//  PriorityQueue.h
//  Assignment#5-Timer
//
//  Created by Jacob Espersen on 01/02/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue : NSCondition

@property (nonatomic) NSMutableArray *pQueue;
@property (nonatomic, readonly) NSEnumerator *iterator;
@property NSInteger size;
//Why do I have to specify "strong" here, is not not set to strong by default?
@property (strong) NSComparator comperator;

- (id)initWithComperator:(NSComparator)comp;
- (BOOL) add:(id)object;
- (BOOL) remove:(id)object;
- (BOOL) contains:(id)object;
- (void) clear;
- (id)peek;
- (id)poll;
- (void)removeAtIndex:(NSInteger)index;
- (NSArray*)toArray;
- (BOOL)isEmpty;



@end