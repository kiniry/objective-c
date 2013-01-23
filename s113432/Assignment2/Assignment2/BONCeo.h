//
//  BONCeo.h
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/22/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONCitizen.h"

@interface BONCeo : BONCitizen
@end
@protocol GetWorkDone
- (id) work;
- (bool) workIsDone;
@end