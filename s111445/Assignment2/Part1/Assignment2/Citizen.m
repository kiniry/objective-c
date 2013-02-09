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

#import "Citizen.h"

@interface Citizen()
@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite) BOOL sex;
@property (nonatomic, readwrite) NSUInteger age;
@property (nonatomic, readwrite, weak) Citizen *spouse;
@property (readwrite, weak) NSSet *parents;
@end



@implementation Citizen

@synthesize name;
@synthesize sex;
@synthesize age;
@synthesize spouse;
@synthesize children;
@synthesize parents;
@synthesize single;

-(BOOL) isSingle
{
	return self.spouse == NULL;
}

// at least 2 citizens can't have parents (or the set of citizens would be infinite), therefore we should
// allow for mother of father to be null
-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother 
{
  if (self = [super init])
  {
    self.name = name;
	self.sex = sex;
	self.age = age;
	if (father && mother) 
	{
		self.parents = [NSSet setWithObjects:father, mother, nil];
		// add this citizen as child to his/her parents
		[mother addChild:self];
		[father addChild:self];
	}
	else {
		if (!mother && !father) 
		{
			self.parents = [NSSet setWithObjects:[NSNull null], [NSNull null], nil];
		}
		else 
		{
			if (mother)
			{
				self.parents = [NSSet setWithObjects:mother, [NSNull null], nil];
				[mother addChild:self];
			}
			else
			{
				self.parents = [NSSet setWithObjects:father, [NSNull null], nil];
				[father addChild:self];
			}
		}
	}
	
  }
  return self;
}  

-(id) initWithName:(NSString*)name sex:(BOOL)sex age:(NSUInteger)age father:(Citizen*)father mother:(Citizen*)mother spouse:(Citizen*)spouse
{
	self = [self initWithName:name sex:sex age:age father:father mother:mother];
	if (self) {
		[self marry:spouse];
	}
	return self;
}

-(BOOL) canMarryCitizen:(Citizen*)person
{
	if (self.isSingle && person && person.isSingle && 
		![self.children member:person] && ![self.parents member:person] &&
		!(self.sex == person.sex))
	{
		return YES;
	}
	else
	{
		return NO;
	}
}

// it is said in the requirements that this method should return no value,
// even though an indication about the successfulness of the operation 
// could have been useful
-(void) marry:(Citizen*)sweetheart
{
	if (sweetheart && [self canMarryCitizen:sweetheart])
	{
		self.spouse = sweetheart;
		sweetheart.spouse = self;
	}
}

-(void) divorce
{
	if (!self.isSingle)
	{
		self.spouse.spouse = nil;
		self.spouse = nil;
	}
}

-(void) addChild:(Citizen*)child
{
	// make sure that this child was not added before and that self is parent of this child
	// add the child to the set of children
	if (![self.children member:child] && [child.parents member:self]){
		// lazy instantiation of the set of children
		if (!self.children){
			self.children = [NSMutableSet setWithCapacity:1];
		}
		
		[self.children addObject:child];
	}
}

// we assume that a citizen is fully identified by name, sex and age
-(BOOL) isEqualToCitizen:(Citizen*)other
{
	if (self == other) return YES;
	if ([[self.name lowercaseString] isEqual:[other.name lowercaseString]] &&
		(self.sex == other.sex) &&
		(self.age == other.age))
	{
		return YES;
	}
	else
	{
		return NO;
	}
}

-(BOOL) isEqual:(id)objToCompareTo
{
	if ([objToCompareTo isKindOfClass:[NSNull class]]) return NO;
	if (objToCompareTo == self) return YES;
	if (!objToCompareTo || ![objToCompareTo isKindOfClass:[self class]]) return NO;
	return [self isEqualToCitizen:objToCompareTo];
}

-(NSString*) description
{			
	__block NSString *parentNames = @"";
	[self.parents enumerateObjectsUsingBlock:^(id obj, BOOL *stop){
		if (obj && (obj != [NSNull null])) 
			parentNames = [parentNames stringByAppendingString:
							[NSString stringWithFormat:@"%@ ", ((Citizen*)obj).name]
						  ];
	}];
	
	__block NSString *childrenNames = @"";
	[self.children enumerateObjectsUsingBlock:^(id obj, BOOL *stop){
		if (obj && (obj != [NSNull null])) 
			childrenNames = [childrenNames stringByAppendingString:
							[NSString stringWithFormat:@"%@ ", ((Citizen*)obj).name]
						  ];
	}];
	
	return [NSString stringWithFormat:@"\nSocial status: %@\
	\nName: %@\
	\nSex: %@\
	\nAge: %d\
	\nParents: %@\
	\nMarital status: %@\
	\nSpouse: %@ \
	\nChildren: %@",
	[self class] == [Citizen class] ? @"Citizen":@"Noble Person",
	self.name,
	self.sex ? @"Male":@"Female",
	self.age,
	parentNames,
	self.spouse ? @"Married":@"Single",
	self.spouse ? self.spouse.name:@"-",
	childrenNames];
}

@end
