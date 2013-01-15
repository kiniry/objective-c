//
//  Tommy.m
//  Assignment2-2
//
//  Created by Andreas Graulund on 14/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Tommy.h"

@implementation Tommy

-(void) callFriend: (NSString *) name {
	NSLog(@"Tommy (privately known as %@) is calling %@...", self.fullName, name);
}

-(void) greeting {
	NSLog(@"Yo dude, this is Tommy, what's up?");
}

@end
