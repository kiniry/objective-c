//
//  NoblePerson.h
//  Assignment2
//
//  Created by Philip Nielsen on 14/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

@property float assets;
@property (nonatomic) Citizen *butler;

- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age assets:(float)assets;
- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age parents:(NSArray *)parents assets:(float)assets;

@end
