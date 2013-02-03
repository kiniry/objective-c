//
//  Random.h
//  assignment5
//
//  Created by Joachim on 03/02/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Random : NSObject

-(id)initWithSeed:(long)seed;
-(int)next:(int)bits;
-(void)nextBytes:(NSMutableData*) bytes;
-(int)nextInt;
-(int)nextIntWithMaxVal:(int)max;
-(long)nextLong;
-(BOOL)nextBoolean;
-(float)nextFloat;
-(double)nextDouble;
-(double)nextGaussian;

@end
