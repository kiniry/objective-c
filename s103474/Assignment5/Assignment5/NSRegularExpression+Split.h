//
//  NSRegularExpression+Split.h
//  Assignment5
//
//  Created by Andreas Graulund on 26/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRegularExpression (Split)
-(NSArray *)splitByMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
@end
