//
//  Citizen.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 10/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

/*
 Class representing the notion of a citizen. 
 A citizen has: firstName, lastName, age, spouse, children, parents, gender, impediment to marriage.
 A citizen can: marry, divorce
 A citizen is constrained:
    Each citizen has two parents.
    At most one spouse allowed.
    May not marry children or parents or person of same sex. Spouse’s spouse must be this person.
    All children, if any, must have this person among their parents.
 */
#import <Foundation/Foundation.h>

typedef enum {male, female} gender;

@interface Citizen : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *age;
@property (nonatomic) gender sex;

@property Citizen *mother;
@property Citizen *father;

@property (nonatomic) Citizen *spouse;
@property (nonatomic) NSMutableArray *children;

//@property BOOL *impedimentToMarriage; //can't work out what this should be

- (Citizen *)initWithFirstName:(NSString *)fName
                   andLastName:(NSString *)lName
                        andAge:(NSNumber *)age;
;

- (BOOL)isSingle;   //has no spouse
- (void)marry:(Citizen *)aSpouse;   //connect 2 Citizens as spouses
- (void)divorce;    //remove citizen.spouse connections of both
- (void)addChild:(Citizen *)child;  //add citizen (child) to parents children and set child's parents
@end
