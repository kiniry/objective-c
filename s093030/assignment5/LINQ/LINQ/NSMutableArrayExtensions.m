//
//  NSMutableArrayExtensions.m
//  LINQ
//
//  Created by Søren Olofsson on 2/3/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "NSMutableArrayExtensions.h"

@implementation NSMutableArray(LINQ)

// Counts the amount of items that fulfills the predicate
-(long)count: (BOOL (^)(id))predicate
{
    long count = 0;
    for (id obj in self) if (predicate(obj)) count++;
    return count;
}

// Finds the maximum in the array
-(long)max
{
    long max = (long)[self objectAtIndex:0];
    for (id obj in self) {
        long lObj = (long) obj;
        if(lObj > max) max = lObj;
    }
    return max;
}

// Finds the maximum in the array using a function to retrieve a numeric value from each element in the array
-(long)max: (long (^)(id))func
{
    long max = func([self objectAtIndex:0]);
    for (id obj in self) {
        long value = func(obj);
        if(value > max) value = value;
    }
    return max;
}

// Finds the minimum in the array
-(long)min
{
    long min = (long)[self objectAtIndex:0];
    for (id obj in self) {
        long lObj = (long) obj;
        if(lObj < min) min = lObj;
    }
    return min;
}

// Finds the minimum in the array using a function to retrieve a numeric value from each element in the array
-(long)min: (long (^)(id))func
{
    long min = func([self objectAtIndex:0]);
    for (id obj in self) {
        long value = func(obj);
        if(value < min) min = value;
    }
    return min;
}

// Calculates the sum in the array
-(long)sum
{
    long sum = 0;
    for (id obj in self) sum +=(long) obj;
    return sum;
}

// Calculates the sum in the array using function to retrieve a numeric value from each element in the array
-(long)sum: (long (^)(id))func
{
    long sum = 0;
    for (id obj in self) sum +=func(obj);
    return sum;
}

// Calculates the average in the array
-(double)average
{
    return ((double)self.sum) / ((double)self.count);
}

// Calculates the average in the array using function to retrieve a numeric value from each element in the array
-(double)average: (long (^)(id))func
{
    return ((double) [self sum:func]) / ((double)self.count);
}

// Filters the array according to a predicate
-(NSMutableArray*)where: (BOOL (^)(id))predicate
{
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) if (predicate(obj)) [array addObject:obj];
    return array;
}

// Checks whether an element in the array fulfills a predicate
-(BOOL)contains: (BOOL (^)(id))predicate
{
    for (id obj in self) if (predicate(obj)) return true;
    return false;
}

// Checks whether all elements in the array fulfills a predicate
-(BOOL)all: (BOOL (^)(id))predicate
{
    for (id obj in self) if (!predicate(obj)) return false;
    return true;
}

// Iterates through an array and creates a new element using a constructor function (map)
-(NSMutableArray*)select: (id (^)(id))constructor
{
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) [array addObject:(constructor(obj))];
    return array;
}

// Filters an array and creates a new element using a constructor function (filter and map)
-(NSMutableArray*)select: (id (^)(id))constructor where:(BOOL (^)(id))predicate
{
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) if(predicate(obj)) [array addObject:(constructor(obj))];
    return array;
}

// Orders an array
-(NSMutableArray*)orderby: (NSComparisonResult (^)(id, id))comparer
{
    NSArray *array = [NSArray arrayWithArray:self];
    return [NSMutableArray arrayWithArray: [array sortedArrayUsingComparator:comparer]];
}

// Reverses an array
-(NSMutableArray*)reverse
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity: self.count];
    long i = array.count - 1;
    for (id obj in self) [array insertObject:obj atIndex:i--];
    return array;
}

// Unions two arrays
-(NSMutableArray*)unionWith:(NSMutableArray*)array
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity: self.count + array.count];
    for (id obj in self) { [result addObject:obj]; }
    for (id obj in array) { [result addObject:obj]; }
    return array;
}

// Retrieves the first element in the array
-(NSMutableArray*)first
{
    return [self objectAtIndex:0];
}

// Retrieves the last element in the array
-(NSMutableArray*)last
{
    return [self objectAtIndex:self.count - 1];
}

// Transforms an array into a dictionary using a constructor function
-(NSMutableDictionary*)toDictionary: (id (^)(id))constructor
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (id obj in self) [[dictionary objectForKey:constructor(obj)] addObject:obj];
    return dictionary;
}

// Transforms an array into a set using a constructor function
-(NSMutableSet*)toSet: (id (^)(id))constructor
{
    return [NSMutableSet setWithArray:[NSArray arrayWithArray: [self select:constructor]]];
}

// Transforms an array into a set
-(NSMutableSet*)toSet
{
    return [NSMutableSet setWithArray:[NSArray arrayWithArray:self]];
}

// Gets all distinct elements from an array
-(NSMutableDictionary*)distinct
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (id obj in self) if([dictionary objectForKey:obj] == nil) [[dictionary objectForKey:obj] addObject:obj];
    return [[dictionary allValues] mutableCopy];
}

// Gets all elements that is not present in the array passed as argument (difference)
-(NSMutableArray*)except:(NSMutableArray*)array
{
    NSMutableSet *set = [array toSet];
    NSMutableArray *result = [NSMutableArray array];
    for (id obj in self) if(![set containsObject:obj]) [result addObject:obj];
    return result;
}

// Returns the intersection between two arrays
-(NSMutableArray*)intersect:(NSMutableArray*)array
{
    NSMutableSet *set = [array toSet];
    NSMutableArray *result = [NSMutableArray array];
    for (id obj in self) if([set containsObject:obj]) [result addObject:obj];
    return result;
}


@end
