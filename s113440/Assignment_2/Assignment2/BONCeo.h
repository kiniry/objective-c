//
//  BONCeo.h
//  BONCITIZEN
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/22/13.
//  Copyright (c) 2013 Bastian Buch, s113432 and Jacob Gjerstrup, s113440. All rights reserved.
//

#import "BONCitizen.h"

// Implementing our first protocol
@interface BONCeo : BONCitizen
@end
@protocol GetWorkDone
- (id) work;
- (bool) workIsDone;
@end