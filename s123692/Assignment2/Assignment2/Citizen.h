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
{
    NSString* _name;
    Sex _sex;
    int _age;
    BOOL _single;
    NSSet* _children;
    NSSet* _parents;
}

@property (nonatomic) NSString* name;
@property (nonatomic) Sex sex;
@property (nonatomic) int age;
@property (nonatomic) BOOL single;
@property (nonatomic) Citizen* spouse;
@property (readonly, nonatomic) NSSet* children;
@property (readonly, nonatomic) NSSet* parents;

// Constructor
-(id) initWithName: (NSString *)name
            andSex: (Sex)sex
            andAge: (int)age;

// Parents
-(void) addParent: (Citizen *)parent;
-(void) removeParent: (Citizen *)parent;

// Children
-(void) addChild: (Citizen *)child;
-(void) removeChild: (Citizen *)child;

// Civil status
-(void) marryTo: (Citizen *)bride;
-(void) divorceFrom: (Citizen *)fiancee;

@end
