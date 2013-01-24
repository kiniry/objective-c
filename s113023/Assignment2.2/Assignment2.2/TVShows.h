//
//  PinkFloyd.h
//  Assignment2.2
//
//  Created by Andreas Haure on 22/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVShows : NSObject

- (id)initWithTVShows: (NSArray *)tvShowsList;
- (void)enumerateTVShowsWithBlock:(void (^)(NSString *name, int index, BOOL *stop))block;

@end
