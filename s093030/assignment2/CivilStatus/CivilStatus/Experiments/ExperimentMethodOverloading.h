//
//  ExperimentMethodOverloading.h
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExperimentMethodOverloading : NSObject

-(void) appendToFile:(NSString *)path anInteger:(int)myInt;

-(void) appendToFile:(NSString *)path aString:(NSString *)myString;

-(void) appendToFile:(NSString *)path something:(NSString *)something;

@end
