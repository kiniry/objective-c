//
//  Citizen.h
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Male,
    Female
} Sex;

@interface Citizen : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) Sex sex;
@property (nonatomic) int age;
@property (nonatomic) BOOL single;
@property (nonatomic) Citizen* spouse;
@property (nonatomic) NSMutableArray* children;
@property (nonatomic) NSArray* parents;

-(id) initWithName: (NSString *)name
            andSex: (Sex)sex
            andAge: (int)age
         andSingle: (BOOL)single;

-(void) marry: (Citizen *)bride;
-(void) divorce: (Citizen *)spouse;

@end
