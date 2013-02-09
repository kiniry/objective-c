/*
   Project: Assignment2

   Copyright (C) 2013 Free Software Foundation

   Author: Cybus

   Created: 2013-02-03 14:47:54 +0100 by Cybus

   This application is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This application is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
*/

#ifndef _CITIZEN_H_
#define _CITIZEN_H_

#import <Foundation/Foundation.h>

@interface Citizen : NSObject {
	@private NSString *name;
	@private BOOL sex;
	@private NSUInteger age;
	@private __weak Citizen *spouse;
	@private __weak NSMutableSet *children;
	@private __weak NSSet *parents;
	@private BOOL single;
}

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) BOOL sex;
@property (nonatomic, readonly) NSUInteger age;
@property (nonatomic, readonly, weak) Citizen *spouse;
@property (weak) NSMutableSet *children;
@property (readonly, weak) NSSet *parents;
@property (nonatomic, readonly) BOOL single;

// designated initializer
-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother;

-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother spouse:(Citizen*)spouse;

-(BOOL) canMarryCitizen:(Citizen*)person;
-(void) marry:(Citizen*)sweetheart;
-(void) divorce;
-(void) addChild:(Citizen*)child;
-(NSString*) description;

@end

#endif // _CITIZEN_H_

