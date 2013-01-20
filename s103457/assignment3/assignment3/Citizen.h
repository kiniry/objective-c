//
//  Citizen.h
//  assignment2
//
//  Created by Anders Emil Nielsen on 10/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { male, female } SEX;

@interface Citizen : NSObject

/* Init methods */
-(Citizen *)initWithName:(NSString *)name
                  andSex:(SEX)sex
                  andAge:(NSNumber *)age;

/* Queries */
@property NSString *name;
@property SEX sex;
@property NSNumber *age;
@property (readonly) Citizen *spouse;
@property (nonatomic) NSMutableSet *children;

-(BOOL)single;
-(NSArray *)parents;
-(BOOL)canMarry:(Citizen *)sweetheart;

/* Commands */
-(void)marry:(Citizen *)sweetheart;
-(void)divorse;
-(void)setMother:(Citizen *)mother andFather:(Citizen *)father;

/* Description */
-(NSString *)description;

@end
