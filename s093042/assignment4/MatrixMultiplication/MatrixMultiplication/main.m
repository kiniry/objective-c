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
        NSUInteger sizeOfMatrix = 25;
        
        if(argc > 1)
            sizeOfMatrix = atoi(argv[1]);
        
        Matrix *aMatrix = [Matrix matrixWithSizeN:sizeOfMatrix M:sizeOfMatrix random:YES];
        //aMatrix.d[0][0] = [NSNumber numberWithDouble:2.0];
        //aMatrix.d[0][1] = [NSNumber numberWithDouble:2.0];
        Matrix *bMatrix = [Matrix matrixWithSizeN:sizeOfMatrix M:sizeOfMatrix random:YES];
        //bMatrix.d[0][0] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[0][1] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[1][0] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[1][1] = [NSNumber numberWithDouble:5.0];
        
        // start the timer
        NSDate *start = [NSDate date];
        Matrix *cMatrix = [Matrix multiplyMatrix:aMatrix andMatrix:bMatrix];
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"Multiplication of two random %lu x %lu sized matrices took %f ms", sizeOfMatrix, sizeOfMatrix, (timeInterval*-1000));
        
        //NSLog(@"%@", aMatrix);
        //NSLog(@"%@", bMatrix);
        //NSLog(@"%@", cMatrix);
    }
    return 0;
}

