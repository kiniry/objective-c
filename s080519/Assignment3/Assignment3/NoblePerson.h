//
//  NoblePerson.h
//  Assignment3
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

- (void) setCapital: (int) capital;
- (int) capital;
- (void) setButler: (Citizen *) buttler;
- (BOOL) marry: (Citizen *) person;
- (NSString *) description;
@end
