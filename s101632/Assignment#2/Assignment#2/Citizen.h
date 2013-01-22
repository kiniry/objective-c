//
//  Citizen.h
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

typedef enum{
    male,
    female,
} Sex;

@property (copy) NSString* name;
@property Sex sex;
@property NSNumber* age;
@property (nonatomic, readonly) BOOL single;

@property Citizen* spouse;
@property Citizen* mother;
@property Citizen* father;
@property NSMutableArray* Children;

- (Citizen*)initWithFirstName:(NSString*)fName sex:(Sex)sex
                    age:(NSNumber*)age;

- (void)marry:(Citizen*)spouse;
- (BOOL)single;
- (BOOL)impedimentToMarriage:(Citizen*)citizen;


@end
