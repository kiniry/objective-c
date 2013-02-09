/*
   Project: Assignment2

   Copyright (C) 2013 Free Software Foundation

   Author: Cybus

   Created: 2013-02-05 22:06:20 +0100 by Cybus

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

#ifndef _NOBLEPERSON_H_
#define _NOBLEPERSON_H_

#import <Foundation/Foundation.h>
#import "Citizen.h"

#define WEDDING_COST 50000

@interface NoblePerson : Citizen
{
	//@private __weak NoblePerson *nobleSpouse;
	@private NSInteger assets;
	@private Citizen* butler;
}

@property (nonatomic) NSInteger assets;
@property (nonatomic, readonly) Citizen* butler;

-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother butler:(Citizen*)butler;
-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother butler:(Citizen*)butler spouse:(NoblePerson*)spouse;
-(void) marry:(NoblePerson*)fiancee;
-(NoblePerson*) spouse;
-(NSString*) description;

@end

#endif // _NOBLEPERSON_H_

