//
//  Matrix.m
//  MatrixMultiplication
//
//  Created by Sivanujann Selliah on 22/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Matrix.h"

@interface Matrix ()
@property (readonly) BOOL random;
-(id)initWithSizeN:(NSUInteger)aN M:(NSUInteger)aM random:(BOOL)isRandom;

@end

@implementation Matrix

-(NSMutableArray *)d
{
    if(!_d)
    {
        _d = [NSMutableArray array];
        if(self.random)
        {
            for (int i = 0; i < self.n; i++) {
                NSMutableArray *tmp = [NSMutableArray array];
                
                for (int j = 0; j < self.m; j++) {
                    double val = arc4random_uniform(100);
                    [tmp insertObject:[NSNumber numberWithDouble:val] atIndex:0];
                }
                
                [_d insertObject:tmp atIndex:0];
            }
        }
        else
        {
            for (int i = 0; i < self.n; i++) {
                NSMutableArray *tmp = [NSMutableArray array];
                
                for (int j = 0; j < self.m; j++) {
                    double val = 0.0;
                    [tmp insertObject:[NSNumber numberWithDouble:val] atIndex:0];
                }
                
                [_d insertObject:tmp atIndex:0];
            }
        }
    }
    
    return _d;
}

+(id)matrixWithSizeN:(NSUInteger)aN M:(NSUInteger)aM random:(BOOL)isRandom
{
    return [[self alloc] initWithSizeN:aN M:aM random:isRandom];
}

-(id)initWithSizeN:(NSUInteger)aN M:(NSUInteger)aM random:(BOOL)isRandom
{
    self = [super init];
    if(self)
    {
        _n = aN;
        _m = aM;
        _random = isRandom;
    }
    return self;
}


// for testing method invocation, enumerations and iteration, Foundation classes
+(Matrix *)multiplyMatrix:(Matrix *)a andMatrix:(Matrix *)b
{
    if([a.d count] == 0) return [Matrix matrixWithSizeN:0 M:0 random:NO];
    if([a.d[0] count] != [b.d count]) return nil;
    
    NSUInteger n = [a.d[0] count];
    NSUInteger m = [a.d count];
    NSUInteger p = [b.d[0] count];
    
    Matrix *res = [Matrix matrixWithSizeN:m M:p random:NO];
    for (int i = 0; i<m; i++) {
        for (int j = 0; j<p; j++) {
            for (int k = 0; k<n; k++) {
                NSNumber *inner = [NSNumber numberWithDouble:([a.d[i][k] doubleValue]*[b.d[k][j] doubleValue])];
                NSNumber *beforeRes = res.d[i][j];
                NSNumber *add = [NSNumber numberWithDouble:([inner doubleValue]+[beforeRes doubleValue])];
                res.d[i][j] = add;
            }
        }
    }
    
    return res;
}

/*
 Java code from http://rosettacode.org/wiki/Matrix_multiplication#Java
public static double[][] mult(double a[][], double b[][]){
    if(a.length == 0) return new double[0][0];
    if(a[0].length != b.length) return null;
    
    int n = a[0].length;
    int m = a.length;
    int p = b[0].length;
    
    double ans[][] = new double[m][p];
    
    for(int i = 0;i < m;i++){
        for(int j = 0;j < p;j++){
            for(int k = 0;k < n;k++){
                ans[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    return ans;
}
 */

-(NSString *)description
{
    return [self.d description];
}
@end
