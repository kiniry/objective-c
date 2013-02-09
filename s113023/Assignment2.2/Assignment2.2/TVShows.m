//
//  PinkFloyd.m
//  Assignment2.2
//
//  Created by Andreas Haure on 22/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "TVShows.h"

@interface TVShows ()

@property (readonly) NSArray *tvShowsList;

@end

@implementation TVShows

- (id)initWithTVShows: (NSArray *)tvShowsList
{
    self = [super init];
    if (self){
        _tvShowsList = tvShowsList;
    }
    return self;
}

- (void)enumerateTVShowsWithBlock:(void (^)(NSString *, int, BOOL *))block{
    BOOL stop = NO;
    for (int i = 0; i < [_tvShowsList count]; i++){
        block(_tvShowsList[i],i,&stop);
        if (stop == YES)
            return;
    }
}

@end
