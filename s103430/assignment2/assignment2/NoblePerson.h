//
//  NoblePerson.h
//  assignment2
//
//  Created by Joachim on 16/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen

//@property NoblePerson *spouse;
@property int assets;
@property Citizen *butler;

-(void)assetsAfterWedding:(NoblePerson*)nobleperson;
-(void)butlerAfterWedding:(NoblePerson*)nobleperson;

@end
