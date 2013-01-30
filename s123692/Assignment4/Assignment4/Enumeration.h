//
//  Enumeration.h
//  Assignment4
//
//  Created by Markus Færevaag on 24.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enumeration : NSObject

@property (nonatomic) NSArray *array;
@property int limit;
@property (nonatomic) NSNumber *currentNumber;

-(id) initWithLimit:(int)limit;

-(void) classicIteration;
-(void) classicEnumeration;
-(void) fastEnumeration;

@end
