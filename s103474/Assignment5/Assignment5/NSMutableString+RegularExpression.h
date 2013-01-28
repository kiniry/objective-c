//
//  NSMutableString+RegularExpression.h
//  Assignment5
//
//  Created by Andreas Graulund on 26/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (RegularExpression)

-(NSUInteger)replaceOccurrencesOfMatch:(NSString *)match withString:(NSString *)replacement;

@end
