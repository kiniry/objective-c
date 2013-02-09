/*************************************************************************
 *  File name   : ClassNoProtocol.h
 *  Description : ClassNoProtocol class headerfile.
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@protocol ClassNoProtocol_Protocol

- (void)helloWorld;

@end

@interface ClassNoProtocol : NSObject

- (void)helloWorld;

@end
