/*************************************************************************
 *  File name   : mem_Test.h
 *  Description : Memory Test headerfile
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@interface Citizen : NSObject
{ 
  NSMutableArray* _test;
}

- (id) initWithName:(NSString*)name withSex:(NSString*)sex withAge:(NSNumber*)age;

@property (readonly, nonatomic) NSMutableArray* test;

@end
