//
//  IteratorTester.h
//  Ass4Enumerations
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IteratorTester : NSObject

@property (strong) NSSet *set;

-(id) initWithIterationsCount: (unsigned int) iterations;

-(void) oldStyleIteration;
-(void) oldStyleEnumeration;
-(void) fastEnumeration;

@end
