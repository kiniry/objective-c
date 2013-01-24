//
//  BONNoble.h
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONCitizen.h"

@interface BONNoble : BONCitizen
@property (nonatomic) BONNoble *spouse;
@property (nonatomic) int assets;
@property (nonatomic) BONCitizen *butler;
@end
