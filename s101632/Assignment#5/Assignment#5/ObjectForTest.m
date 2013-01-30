//
//  ObjectForTest.m
//  Assignment#5
//
//  Created by Jacob Espersen on 30/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "ObjectForTest.h"

@implementation ObjectForTest

- (id)initWithSortVal:(NSInteger)v{
    if (self = [super init]) {
        self.sortByThis = v;
    }
    return self;
}
@end
