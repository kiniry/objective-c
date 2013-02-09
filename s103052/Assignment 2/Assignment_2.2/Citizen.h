/*************************************************************************
 *  File name   : Citizen.h
 *  Description : Test Class Citizen headerfile
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@interface Citizen : NSObject
{ 
  NSString* _name;
}

- (id) initWithName:(NSString*)newName;

@property (readwrite, nonatomic, assign) NSString* name;

- (NSString*)getCitizenName;

@end
