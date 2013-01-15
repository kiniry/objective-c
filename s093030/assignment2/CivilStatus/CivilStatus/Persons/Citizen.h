//
//  Citizen.h
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

// Properties
@property (nonatomic) NSString *name;
@property (nonatomic, readonly) BOOL sex;
@property (nonatomic) NSNumber *age;
@property (nonatomic, readonly) BOOL single;
@property (nonatomic, readonly) Citizen *spouse;
@property (nonatomic, readonly) Citizen *mother;
@property (nonatomic, readonly) Citizen *father;
@property (nonatomic, strong, readonly) NSArray *children;
@property BOOL impedimentToMarriage;

// Methods
-(BOOL) marry:(Citizen*) fiancee;
-(BOOL) divorce;
-(id) initWithMother:(Citizen*) mother andFather:(Citizen*) father andSex:(BOOL) sex;
-(id) initWithMother:(Citizen*) mother andFather:(Citizen*) father andSex:(BOOL) sex andName:(NSString*) name;

// Extra methods
-(Citizen *) giveBirthAndNameChild:(NSString*) name;
-(Citizen *) giveBirthToSpecificSex:(BOOL) sex andNameChild:(NSString*) name;

@end
