//
//  main.m
//  Assignment#5
//
//  Created by Jacob Espersen on 28/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"
#import "ObjectForTest.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Test with NSStrings
        PriorityQueue *queue = [[PriorityQueue alloc] init];
        NSString *jacob = @"Jacob";
        NSString *kristia = @"Kristian";
        NSString *mads = @"Mads";
        [queue add:jacob];
        [queue add:mads];
        [queue add:kristia];
        NSString *str = [queue peek];
        NSLog(@"the peek is: %@", str);
        NSString *poll =[queue poll];
        NSString *newPeek = [queue peek];
        NSLog(@"the poll was %@ and new peek is %@", poll, newPeek);
        
        //Test with NSNumbers
        queue = [[PriorityQueue alloc] init];
        NSNumber *num1 = [[NSNumber alloc] initWithInt:1];
        NSNumber *num2 = [[NSNumber alloc] initWithInt:2];
        NSNumber *num3 = [[NSNumber alloc] initWithInt:3];
        [queue add:num3];
        [queue add:num3];
        [queue add:num2];
        NSNumber *peek = [queue peek];
        NSLog(@"the peek is: %@", peek);
        [queue poll];
        NSNumber* numPoll = [queue poll];
        NSNumber* numPeek = [queue peek];
        NSLog(@"the poll was %@ and new peek is %@", numPoll, numPeek);
        
        //Test with customized object and comperator
        ObjectForTest* obj1 =  [[ObjectForTest alloc] initWithSortVal:1];
        ObjectForTest* obj2 =  [[ObjectForTest alloc] initWithSortVal:2];
        ObjectForTest* obj3 =  [[ObjectForTest alloc] initWithSortVal:3];
        queue =  [[PriorityQueue alloc] initWithComperator:^(ObjectForTest* obj1,ObjectForTest* obj2){
            if (obj1.sortByThis > obj2.sortByThis) return NSOrderedDescending;
            if (obj1.sortByThis < obj2.sortByThis)return NSOrderedAscending;
            return NSOrderedSame;
        }];
        [queue add:obj1];
        [queue add:obj3];
        [queue add:obj2];
        [queue clear];
        ObjectForTest*  objPeek = [queue peek];
        NSLog(@"the peek is: %li", objPeek.sortByThis);
        [queue remove:obj1];
        ObjectForTest* objPoll = [queue poll];
        ObjectForTest* nObjPeek = [queue peek];
        NSLog(@"the poll was %li and new peek is %li", objPoll.sortByThis,nObjPeek.sortByThis);
        
        
    }
    return 0;
}

