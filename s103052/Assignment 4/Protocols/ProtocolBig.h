/*************************************************************************
 *  File name   : ProtocolBig.h
 *  Description : ProtocolBig class headerfile.
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

@protocol Test1_Protocol
- (void)Test1;
@end

@protocol Test2_Protocol
- (void)Test2;
@end

@protocol Test3_Protocol
- (void)Test3;
@end

@protocol Test4_Protocol
- (void)Test4;
@end

@protocol Test5_Protocol
- (void)Test5;
@end

@protocol Test6_Protocol
- (void)Test6;
@end

@protocol Test7_Protocol
- (void)Test7;
@end

@protocol Test8_Protocol
- (void)Test8;
@end

@protocol Test9_Protocol
- (void)Test9;
@end

@protocol Test10_Protocol
- (void)Test10;
@end

@interface ProtocolBig : NSObject <Test1_Protocol,Test2_Protocol,Test3_Protocol,Test4_Protocol,Test5_Protocol,Test6_Protocol,Test7_Protocol,Test8_Protocol,Test9_Protocol,Test10_Protocol>

@end
