//
//  Citizen.h
//  assignment2
//
//  Created by Magloire on 1/16/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject


typedef enum{
    male,
    female
}Sex;


@property NSString *firstName;
@property NSString *lastName;
@property Sex sex;
@property int age;
@property (readonly,getter = isSingle) BOOL single;  // change the name of getter accessor method. from getSingle to isSingle
@property (nonatomic) Citizen *spouse;
@property (nonatomic)NSMutableSet *children;
@property (nonatomic)NSMutableSet *parents;

/*
 
 */
-(id) initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;
-(BOOL) canMarry:(Citizen *) sweetHeart;
-(void) marry:(Citizen *) sweetHeart;
-(void) divorce;
-(void) addParent:(Citizen *) parent;
-(void) addChild:(Citizen *) child;
@end
