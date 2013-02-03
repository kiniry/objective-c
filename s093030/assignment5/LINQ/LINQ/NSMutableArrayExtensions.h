//
//  NSMutableArrayExtensions.h
//  LINQ
//
//  Created by Søren Olofsson on 2/3/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(LINQ)

-(long)count: (BOOL (^)(id))predicate;
-(long)max;
-(long)max: (long (^)(id))func;
-(long)min;
-(long)min: (long (^)(id))func;
-(long)sum;
-(long)sum: (long (^)(id))func;
-(double)average;
-(double)average: (long (^)(id))func;
-(NSMutableArray*)where: (BOOL (^)(id))predicate;
-(BOOL)contains: (BOOL (^)(id))predicate;
-(BOOL)all: (BOOL (^)(id))predicate;
-(NSMutableArray*)select: (id (^)(id))constructor;
-(NSMutableArray*)select: (id (^)(id))constructor where:(BOOL (^)(id))predicate;
-(NSMutableArray*)orderby: (NSComparisonResult (^)(id, id))comparer;
-(NSMutableArray*)reverse;
-(NSMutableArray*)unionWith:(NSMutableArray*)array;
-(NSMutableArray*)first;
-(NSMutableArray*)last;
-(NSMutableDictionary*)toDictionary: (id (^)(id))constructor;
-(NSMutableSet*)toSet: (id (^)(id))constructor;
-(NSMutableSet*)toSet;
-(NSMutableDictionary*)distinct;
-(NSMutableArray*)except:(NSMutableArray*)array;
-(NSMutableArray*)intersect:(NSMutableArray*)array;

@end
