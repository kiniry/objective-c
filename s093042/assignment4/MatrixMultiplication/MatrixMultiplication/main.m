//
//  main.m
//  MatrixMultiplication
//
//  Created by Sivanujann Selliah on 22/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Matrix.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Matrix *aMatrix = [Matrix matrixWithSizeN:100 M:200 random:YES];
        //aMatrix.d[0][0] = [NSNumber numberWithDouble:2.0];
        //aMatrix.d[0][1] = [NSNumber numberWithDouble:2.0];
        Matrix *bMatrix = [Matrix matrixWithSizeN:200 M:200 random:YES];
        //bMatrix.d[0][0] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[0][1] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[1][0] = [NSNumber numberWithDouble:5.0];
        //bMatrix.d[1][1] = [NSNumber numberWithDouble:5.0];
        
        Matrix *cMatrix = [Matrix multiplyMatrix:aMatrix andMatrix:bMatrix];
        
        //NSLog(@"%@",cMatrix);
    }
    return 0;
}

