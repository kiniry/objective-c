//
//  LevenshteinDistance.h
//  LevenshteinDistance
//
//  Created by Andreas Haure on 21/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevenshteinDistance : NSObject

+(int)distanceFromString:(NSString *)stringOne toString:(NSString *)stringTwo;

@end

