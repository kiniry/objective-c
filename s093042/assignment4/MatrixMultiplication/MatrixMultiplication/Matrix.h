//
//  Matrix.h
//  MatrixMultiplication
//
//  Created by Sivanujann Selliah on 22/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Matrix : NSObject

@property (nonatomic) NSMutableArray *d;

+(id)matrixWithSizeN:(NSUInteger)aN M:(NSUInteger)aM random:(BOOL)isRandom;

+(Matrix *)multiplyMatrix:(Matrix *)a andMatrix:(Matrix *)b;

@end
