//
//  BONNoble.h
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch, s113432, and Jacob Gjerstrup, s113440. All rights reserved.
//

#import "BONCitizen.h"

// The interface for the Noble class is defined
@interface BONNoble : BONCitizen
@property (nonatomic) BONNoble *spouse;
@property (nonatomic) int assets;
@property (nonatomic) BONCitizen *butler;
@end
