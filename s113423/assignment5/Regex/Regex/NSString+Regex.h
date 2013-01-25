//
//  NSString+Regex.h
//  Regex
//
//  Created by Salvador Jacobi on 22/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

- (BOOL)matchesRegularExpression:(NSString*)regularExpression error:(NSError**)error;
- (NSString*)stringByReplacingFirstOccurrenceOfRegularExpression:(NSString*)regularExpression withString:(NSString*)replacement error:(NSError**)error;
- (NSString*)stringByReplacingOccurrencesOfRegularExpression:(NSString*)regularExpression withString:(NSString*)replacement error:(NSError**)error;
- (NSArray*)componentsSeparatedByRegularExpression:(NSString*)regularExpression error:(NSError**)error;
- (NSArray*)componentsSeparatedByRegularExpression:(NSString*)regularExpression withLimit:(NSInteger)limit error:(NSError**)error;

@end
