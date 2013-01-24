//
//  LevenshteinDistance.h
//  Levenshtein distance
//
//  Created by Sivanujann Selliah on 18/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevenshteinDistance : NSObject

+(int) distanceBetween:(NSString *)s And:(NSString *)t;

@end
