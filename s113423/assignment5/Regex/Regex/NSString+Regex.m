//
//  NSString+Regex.m
//  Regex
//
//  Created by Salvador Jacobi on 22/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "NSString+Regex.h"

#import "RegexPattern.h"

@implementation NSString (Regex)

- (BOOL)matchesRegularExpression:(NSString*)regularExpression error:(NSError**)error {
  return [RegexPattern regularExpression:regularExpression matchesString:self error:error];
}

- (NSString*)stringByReplacingFirstOccurrenceOfRegularExpression:(NSString*)regularExpression withString:(NSString*)replacement error:(NSError**)error {
  RegexPattern* pattern = [RegexPattern compileRegularExpression:regularExpression error:error];
  if (*error)
    return nil;
  return [[pattern matcherWithInput:self] replaceFirstWithReplacement:replacement];
}

- (NSString*)stringByReplacingOccurrencesOfRegularExpression:(NSString*)regularExpression withString:(NSString*)replacement error:(NSError**)error {
  RegexPattern* pattern = [RegexPattern compileRegularExpression:regularExpression error:error];
  if (*error)
    return nil;
  return [[pattern matcherWithInput:self] replaceAllWithReplacement:replacement];
}

- (NSArray*)componentsSeparatedByRegularExpression:(NSString*)regularExpression withLimit:(NSInteger)limit error:(NSError**)error {
  RegexPattern* pattern = [RegexPattern compileRegularExpression:regularExpression error:error];
  if (*error)
    return nil;
  return [pattern splitString:self withLimit:limit];
}

- (NSArray*)componentsSeparatedByRegularExpression:(NSString*)regularExpression error:(NSError**)error {
  return [self componentsSeparatedByRegularExpression:regularExpression withLimit:0 error:error];
}

@end
