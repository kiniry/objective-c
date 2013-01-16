//
//  main.m
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		// This is an example of the classes created.
		
		// Defining the example objects
		Country *denmark = [[Country alloc] initWithGlobalName: @"Denmark" andLocalName: @"Danmark"];
		
		Citizen *citizen = [[Citizen alloc] initWithFirstName: @"Knud" andLastName: @"Jørgensen"];
		[citizen setSocialSecurity: @2202681025];
		[citizen setSex: male];
		[citizen setCountry: denmark];
		[citizen setBirthDate: [NSDate dateWithString: @"1968-02-22 10:00:00 +0000"]];
		
		NoblePerson *noble = [[NoblePerson alloc] initWithFirstName: @"Mary" andLastName: @"Donaldson"];
		[noble setAssets: @60000000];
		[noble setButler: citizen];
		[noble setSocialSecurity: @2304592497];
		[noble setSex: male];
		[noble setCountry: denmark];
		[noble setBirthDate: [NSDate dateWithString: @"1959-04-23 15:00:00 +0000"]];
		
		// Print 'em out using their description methods!
		NSLog(@"\n%@", citizen);
		NSLog(@"\n%@", noble);
	    
	}
    return 0;
}

