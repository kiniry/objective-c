//
//  ExperimentBlocks.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/15/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "ExperimentBlocks.h"

@implementation ExperimentBlocks

-(void) run
{
    
    // Declare a square-block
    double (^square)(double) = ^(double operand)
    {
        NSLog(@"square block was invoked with %f as operand", operand);
        return operand * operand;
    };
    
    // Declare an 'add five'-block
    double five = 5.0;
    double (^addFive)(double) = ^(double operand)
    {
        NSLog(@"addFive block was invoked with %f as operand", operand);
        return operand + five;
    };
    
    double seven = 7.0;
    double twelve = addFive(seven);
    
    NSLog(@"The result of adding %f to %f is %f", five, seven, twelve);

    double aGross = square(twelve);
    
    NSLog(@"The result of squaring %f is %f", twelve, aGross);
    
    // Declare a block that modifies 'modifiableVariable'
    __block double modifiableVariable = 0.0;
    NSLog(@"modifiableVariable is %f", modifiableVariable);
    void (^modifyVariable)() = ^()
    {
        NSLog(@"modifyVariable was invoked");
        modifiableVariable = 100.0;
    };
    
    modifyVariable();
    
    NSLog(@"modifiableVariable is now %f", modifiableVariable);
}

@end
