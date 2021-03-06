//
//  Citizen.h
//  Assignment2-1
//
//  Created by David Harboe on 1/10/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { undefined, male, female } SEX;
typedef enum { undefined1, single, inRelationship, itIsComplicated } relationshipStatus;

@interface Citizen : NSObject

@property NSString *name;
@property NSNumber *age;
@property SEX sex;
@property relationshipStatus relationshipStatus;

-(Citizen *)initWithName:(NSString *)aName;
-(NSString*) sexString;
-(NSString*) relationshipStatusString;
-(NSString*) description;

@end
