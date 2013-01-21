//
//  CitizenPrivate.h
//  AssertionsAndLogging
//
//  Created by Søren Olofsson on 1/17/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#ifndef AssertionsAndLogging_CitizenPrivate_h
#define AssertionsAndLogging_CitizenPrivate_h

// Provides a private interface for the Citizen interface
@interface Citizen()

// Enables public getter and private setter
// because we do not want anyone outside to :
// 1. change the spouse property directly they should instead call marry or divorce.
// 2. change our mother/father/sex. These properties are something we are born with.

@property (nonatomic, readwrite) Citizen *spouse;
@property (nonatomic, readwrite) Citizen *mother;
@property (nonatomic, readwrite) Citizen *father;
@property (nonatomic, readwrite) BOOL sex;

// Internally we use a mutable array to represent the children
// This makes sure that no outsiders can give us a child
// Especially it makes sure that we cannot have a child that we are not parents to
@property (nonatomic, strong, readwrite) NSMutableArray *mChildren;

// Private methods
-(BOOL) canGiveBirth;
-(BOOL) canDivorce;
-(BOOL) canMarry:(Citizen*) fiancee;

@end

#endif
