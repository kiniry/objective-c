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

#import "NoblePerson.h"

@interface NoblePerson()

@property (nonatomic, readwrite) Citizen* butler;

@end

@implementation NoblePerson

@synthesize butler;
@synthesize assets;

-(NoblePerson*) spouse 
{
	return (NoblePerson*)(super.spouse);
}

-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother butler:(Citizen*)butler
{
	if (self = [super initWithName:name sex:sex age:age father:father mother:mother])
	{
		self.butler = butler;
	}
	
	return self;
}

-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother butler:(Citizen*)butler spouse:(NoblePerson*)spouse
{
	self = [self initWithName:name sex:sex age:age father:father mother:mother butler:butler];
	if (self) {
		[self marry:spouse];
	}
	return self;
}

-(void) marry:(NoblePerson*)fiancee
{
	if (butler && fiancee && [super canMarryCitizen:(Citizen*)fiancee]) {
		[super marry:fiancee];
	
		self.assets += fiancee.assets - WEDDING_COST;
		fiancee.assets = self.assets;
	}
}

-(NSString*) description
{		
	return	[NSString stringWithFormat:
		@" %@ \
		\nButler: %@\
		\nAssets: %d",
		[super description],
		self.butler.name,
		self.assets];
}
@end
