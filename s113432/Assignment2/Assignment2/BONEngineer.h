//
//  BONEngineer.h
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/22/13.
//  Copyright (c) 2013 Bastian Buch, s113432, and Jacob Gjerstrup, s113440. All rights reserved.
//

#import "BONCitizen.h"
#import "BONCeo.h"

// The interface for the engineer is defined
@interface BONEngineer : BONCeo <GetWorkDone>
@property bool workDone;
- (bool) trustMeIAmAnEngineer;
@end
