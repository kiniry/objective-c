/*************************************************************************
 *  File name   : ProtocolOne.h
 *  Description : ProtocolOne class headerfile.
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@protocol ProtocolOne_Protocol

- (void)Test1;
- (void)Test2;
- (void)Test3;
- (void)Test4;
- (void)Test5;
- (void)Test6;
- (void)Test7;
- (void)Test8;
- (void)Test9;
- (void)Test10;

@end

@interface ProtocolOne : NSObject <ProtocolOne_Protocol>

@end
