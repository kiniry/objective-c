//
//  MSPriorityQueue.h
//  assignment5
//
//  Created by Magloire on 1/23/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSElement.h"

@interface MSPriorityQueue : NSObject

@property NSMutableArray *queue;
@property (strong) NSComparator comparator;

-(id) init;
-(id)initWithComparator:(NSComparator)comparator;
-(BOOL) add:(MSElement *)element;
-(BOOL) contains:(MSElement *) element;
-(MSElement *)peek;
-(MSElement *)poll;
-(BOOL)remove:(MSElement *) element;
-(int) size;
-(NSMutableArray *) toArray;
-(NSEnumerator *) iterator;

@end
