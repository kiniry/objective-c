//
//  StringManipulation.h
//  Assignment4
//
//  Created by Markus Færevaag on 25.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringManipulation : NSObject

@property (copy) NSString *immutableString;
@property (copy) NSMutableString *mutableString;
@property int iterations;

-(id) initWithIterations:(int)iterations;

-(void) manipulateImmutableString;
-(void) manipulateMutableString;

@end
