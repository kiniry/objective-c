/*
   Project: Assignment2

   Author: Cybus

   Created: 2013-02-03 14:33:18 +0100 by Cybus
*/

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int
main(int argc, const char *argv[])
{
	id pool = [[NSAutoreleasePool alloc] init];

	Citizen* citizen1 = [[Citizen alloc] initWithName:@"Citizen1" sex:YES age:40 father:nil mother:nil];
	Citizen* citizen2 = [[Citizen alloc] initWithName:@"Citizen2" sex:NO age:35 father:nil mother:nil];
	[citizen1 marry:citizen2];
  
	Citizen* citizen3 = [[Citizen alloc] initWithName:@"Citizen3" sex:YES age:5 father:citizen1 mother:citizen2];

	NSLog(@"%@", citizen1);
	NSLog(@"%@", citizen2);
	NSLog(@"%@", citizen3);
	
	NoblePerson* nbp1 = [[NoblePerson alloc] initWithName:@"NoblePerson1" sex:YES age:60 father:citizen1 mother:citizen2 butler:citizen3];
	NoblePerson* nbp2 = [[NoblePerson alloc] initWithName:@"NoblePerson2" sex:FALSE age:50 father:citizen1 mother:citizen2 butler:citizen3];
	[nbp1 marry:nbp2];
	NSLog(@"%@", nbp1);
	NSLog(@"%@", nbp2);
	[pool release];

	return 0;
}	

