//
//  Random.h
//  Assignment5
//
//  Created by Andreas Haure on 23/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Random : NSObject

-(id)initWithSeed:(long)seed;
-(void)nextBytes:(NSMutableData*)bytes;
-(int)nextInt;
-(int)nextInt:(int)n;
-(long)nextLong;
-(BOOL)nextBoolean;
-(float)nextFloat;
-(double)nextDouble;
-(double)nextGaussian;

@end
