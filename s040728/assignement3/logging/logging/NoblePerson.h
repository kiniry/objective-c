//
//  NoblePerson.h
//  assignment2
//
//  Created by Magloire on 1/16/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

@property int assets;
@property Citizen *butler;
@property (nonatomic) NoblePerson *spouse;
-(void) marry:(NoblePerson *)sweetHeart;
@end
