//
//  ExperimentVariance.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "ExperimentVariance.h"

@interface A : NSObject
- (A*) create;
- (void) sayHi;
@end

@interface B : A
- (B*) create;
- (void) sayHi;
@end

@implementation A
- (A*) create { return self; }
- (void) sayHi { NSLog(@"A hi"); }
@end

@implementation B
- (B*) create { return self; }
- (void) sayHi { NSLog(@"B hi"); }
@end

@implementation ExperimentVariance

-(void) run
{
    A *originalA = [[A alloc] init];
    A *createdA = [originalA create];
    
    NSLog(@"myA: %@", createdA);
    
    B *originalB = [B new];
    B *createdB = [originalB create];
    A *createdBA = [originalB create];
    
    NSLog(@"myB: %@\nmyBA: %@", createdB, createdBA);
    
    [originalA sayHi]; // Prints A hi
    [originalB sayHi]; // Prints B hi
    [createdA sayHi]; // Prints A hi
    [createdB sayHi]; // Prints B hi
    [createdBA sayHi]; // Prints B hi
}

@end
