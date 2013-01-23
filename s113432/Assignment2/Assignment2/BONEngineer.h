//
//  BONEngineer.h
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/22/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONCitizen.h"
#import "BONCeo.h"

@interface BONEngineer : BONCeo <GetWorkDone>
@property bool workDone;
- (bool) trustMeIAmAnEngineer;
@end
