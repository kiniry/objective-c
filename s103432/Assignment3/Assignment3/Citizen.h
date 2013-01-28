//
//  Citizen.h
//  Assignment3
//
//  Created by David Harboe on 1/24/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

typedef enum { undefined, male, female } SEX;
typedef enum { undefined1, single, inRelationship, itIsComplicated } relationshipStatus;

@interface Citizen : NSObject

@property NSString *name;
@property NSNumber *age;
@property SEX sex;
@property relationshipStatus relationshipStatus;

@property Citizen *spouse;
@property NSMutableArray *children;

-(Citizen *)initWithName:(NSString *)aName;
-(NSString*) sexString;
-(NSString*) relationshipStatusString;
-(NSString*) description;

- (void)divorce;
- (void)marry:(Citizen*)spouse;
- (BOOL)canMarry;
- (BOOL)isSingle;

@end
