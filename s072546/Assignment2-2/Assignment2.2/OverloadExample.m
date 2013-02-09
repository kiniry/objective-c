//
//  OverloadExample.m
//  Assignment2.2
//
//  Created by Kim Gad Thomsen on 2/3/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "OverloadExample.h"

@implementation OverloadExample


-(void) baseExampleMethodwithInteger:(int) d {

}
/*
 This is usually how it is done, but not in OBJ-C
-(void) baseExampleMethodwithInteger:(double) d {
    
}
 */

/*
 * In objective-c you have to change the name, so somethiing like this
 */
-(void) baseExampleMethodwithDouble: (double) d {

}

@end
