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
@property (strong) NSString *name;
@property SEX sex;
@property (strong) NSNumber *age;

-(BOOL)single;
-(Citizen *)spouse;
-(NSSet *)children;
-(NSArray *)parents;
-(BOOL)canMarry:(Citizen *)sweetheart;

/* Commands */
-(void)marry:(Citizen *)sweetheart;
-(void)divorse;
-(void)makeChild:(Citizen *)child withParent:(Citizen *)otherParent;

/* Description */
-(NSString *)description;

@end
