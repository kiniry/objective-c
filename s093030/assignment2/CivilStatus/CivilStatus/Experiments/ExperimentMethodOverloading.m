//
//  ExperimentMethodOverloading.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "ExperimentMethodOverloading.h"

@implementation ExperimentMethodOverloading

// Objective-C does not permit method overloading. Instead best practice is
// to declare methods with different names and signatures.
// An example could be an object that writes to a file and want to make
// sure that outsiders only add either strings or integers:
-(void) appendToFile:(NSString *)path anInteger:(int)myInt
{

}
-(void) appendToFile:(NSString *)path aString:(NSString *)myString
{
}

// In "traditional" overloading one would do like this:
-(void) appendToFile:(NSString *)path something:(NSString *)something
{
}
// The second declaration however fails in Objective-C with a:
// "Duplicate declaration of method 'appendToFile:something:'" error message

/*
    Commented out to avoid compile error
 
-(void) appendToFile:(NSString *)path something:(int)something
{

}

// In C# one could declare two overloaded functions in the following way:
public appendToFile(string path, string something)
{
}

public appendToFile(string path, int something)
{
}
 
*/

@end
