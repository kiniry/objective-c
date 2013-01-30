/*************************************************************************
 *  File name   : Parent.h
 *  Description : Test Class Parent headerfile
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "ParentProtocol.h"

@interface Parent : NSObject <ParentProtocol>
{ 
  NSString* _name;
}

- (id) initWithName:(NSString*)newName;

@property (readwrite, nonatomic, assign) NSString* name;

-(void)helloWorld;

@end
