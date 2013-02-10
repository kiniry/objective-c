//
//  MethodInvocation.m
//  StringManipulation
//
//  Created by Emil Klarskov Kristensen on 2/10/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "MethodInvocation.h"

@implementation MethodInvocation

- (NSString*)findInString:(NSString*)string
        replaceWithString:(NSString*)stringToReplaceWith
{
    return [input stringByReplacingOccurrencesOfString:string
                                            withString:stringToReplaceWith];
}

@end
