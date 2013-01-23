//
//  main.m
//  MatrixMultiplication
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Matrix.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Matrix *aMatrix = [Matrix matrixWithSizeN:4 M:2 random:YES];
        //aMatrix.d[0][0] = [NSNumber numberWithDouble:2.0];
        //aMatrix.d[0][1] = [NSNumber numberWithDouble:2.0];
        Matrix *bMatrix = [Matrix matrixWithSizeN:2 M:4 random:YES];
        //bMatrix.d[0][0] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[0][1] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[1][0] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[1][1] = [NSNumber numberWithDouble:5.0];
        
        Matrix *cMatrix = [Matrix multiplyMatrix:aMatrix andMatrix:bMatrix];
        
        NSLog(@"%@", aMatrix);
        NSLog(@"%@", bMatrix);
        NSLog(@"%@", cMatrix);
    }
    return 0;
}

