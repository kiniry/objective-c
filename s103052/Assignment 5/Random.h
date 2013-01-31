/*************************************************************************
 *  File name   : Random.h
 *  Description : Random Class headerfile
 *
 *  Created on  : 25/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@interface Random : NSObject
{ 
  long _seed;
}

@property (readonly) long seed;

- (id) initWithSeed:(long)new_seed;
- (void) nextBytes:(NSMutableData*)bytes;
- (int) nextInt;
- (int) nextInt:(int)n;
- (long) nextLong;
- (BOOL) nextBoolean;
- (float) nextFloat;
- (double) nextDouble;
- (double) nextGaussian;

@end
