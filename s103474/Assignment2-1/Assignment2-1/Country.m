//
//  Country.m
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Country.h"

@implementation Country

@synthesize globalName, localName;

-(Country*) initWithGlobalName: (NSString*) n1 andLocalName: (NSString*) n2 {
	self = [super init];
	if (self) {
		self.globalName = n1;
		self.localName  = n2;
	}
	return self;
}

-(NSString*) description {
	return self.globalName;
}

@end
