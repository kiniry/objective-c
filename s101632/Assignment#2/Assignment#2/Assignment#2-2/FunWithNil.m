//
//  FunWithNil.m
//  Assignment#2
//
//  Created by Jacob Espersen on 16/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "FunWithNil.h"

@implementation FunWithNil


/*
 In objective-c this will run and calling a null pointer wont do anything
 where as in Java this will result in a exception.
 */
- (void)play{
    Citizen*  pers = nil;
    NSLog(@"%c", pers.single);
}

@end
