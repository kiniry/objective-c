//
//  CitizenSuperClass.h
//  Assignment3
//
//  Created by user on 1/21/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitizenSuperClass : NSObject

// BON queries

/* return the name of the properties */
@property (readonly) NSString *name, *sex;
@property NSSet *parents;
// we wanna be able to modify theese
@property  NSInteger *age;
@property  CitizenSuperClass *spouse;
@property  NSMutableOrderedSet *children;

/* Assert if you are ready for marriage? */
- (void)impedimentToMarriage:(CitizenSuperClass *)aSpouse;

/* return Are you single? */
- (BOOL)single;


// BON commands

/* Initialize the person with inputs */
- (CitizenSuperClass *)initWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age;

/* Marry another person */
- (void)marry:(CitizenSuperClass *)imminentSpouse;

/* Divorce your spouse */
- (void)divorce:(CitizenSuperClass *)spouse;

// BON constraints

// Each citizen has two parents
// At most one spouse allowed
// May not marry children or parents or person of same sex
// Spouse's spouse must be this person
// All children, if any, must have this person among their parents

@end
