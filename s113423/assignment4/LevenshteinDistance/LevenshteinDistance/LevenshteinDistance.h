//
//  LevenshteinDistance.h
//  LevenshteinDistance
//
//  Created by Salvador Jacobi on 19/1/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LevenshteinDistance <NSObject>

+ (id <LevenshteinDistance>)sharedInstance;

- (NSUInteger)distanceFrom:(NSString*)stringA to:(NSString*)stringB;

@end
