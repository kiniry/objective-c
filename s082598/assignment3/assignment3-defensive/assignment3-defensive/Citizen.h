//
//  Citizen.h
//  assignment2
//
//  Created by Jonas Eriksen on 18/01/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    male,
    female
} Sex;

@interface Citizen : NSObject

@property (copy) NSString *name;
@property (assign) Sex sex;
@property (assign) int age;

@property (retain, readonly) Citizen *spouse;
@property (readonly) BOOL single;

// set mother and father induvidualy
@property (nonatomic, retain) Citizen *mother;
@property (nonatomic, retain) Citizen *father;
// get parrents as a set
@property (nonatomic, retain, readonly) NSSet *parents;

@property (nonatomic, retain, readonly) NSSet *children;

- (void) parentToCitizen:(Citizen *)child;
- (BOOL) impedimentToMarriageWith:(Citizen *)sweetheart;
- (void) marryCitizen:(Citizen *)sweetheart;
- (void) divorce;

- (id)initWithName:(NSString *)name withSex:(Sex)sex withAge:(int)age;

@end
