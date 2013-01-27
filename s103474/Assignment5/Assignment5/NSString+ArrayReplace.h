//
//  NSString+ArrayReplace.h
//  Assignment5
//
//  Created by Andreas Graulund on 25/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ArrayReplace)

-(NSString *)stringByReplacingOccurrencesOfStrings:(NSArray *)searches withStrings:(NSArray *)replaces;
-(NSString *)stringByReplacingOccurrencesOfStrings:(NSArray *)searches withString:(NSString *)replace;

@end
