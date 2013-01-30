//
//  LevenshteinDistance.h
//  Levenshtein
//
//  Created by Emil Klarskov Kristensen on 1/29/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevenshteinDistance : NSObject

@property NSMutableDictionary *memo;

-(NSInteger)computeLevenshteinDistanceOf:(NSString *)str1 andString:(NSString*)str2;

@end
