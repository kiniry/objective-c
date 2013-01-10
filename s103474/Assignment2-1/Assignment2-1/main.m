//
//  main.m
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Citizen.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		Country *denmark = [[Country alloc] initWithGlobalName: @"Denmark" andLocalName: @"Danmark"];
	    
	    Citizen *citizen = [[Citizen alloc] initWithFirstName: @"Knud" andLastName: @"Jørgensen"];
		[citizen setSocialSecurity: @2202681025];
		[citizen setSex: male];
		[citizen setCountry: denmark];
		[citizen setBirthDate: [NSDate dateWithString: @"1968-02-22 10:00:00 +0000"]];
		
		NSLog(@"\n%@", citizen);
	    
	}
    return 0;
}

