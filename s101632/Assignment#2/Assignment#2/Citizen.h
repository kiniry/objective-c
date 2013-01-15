//
//  Citizen.h
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

@property NSString* firstName;
@property NSString* lastName;
@property NSString* sex;
@property NSNumber* age;
@property Citizen* spouse;
@property NSSet* relatives;

- (id)initWithFirstName:(NSString*)fName lastName:(NSString*)lName
                    sex:(NSString*)sex age:(NSNumber*)age;

@end
