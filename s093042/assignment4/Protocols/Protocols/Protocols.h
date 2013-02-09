//
//  Protocols.h
//  Protocols
//
//  Created by Sivanujann Selliah on 24/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SmallProtocol <NSObject>
@property NSString *test;
-(void)testing;
@optional
-(void)testing2;
@end

@protocol LargeProtocol <NSObject>
@property NSString *test;
-(void)testing;
-(void)testing2;
@optional
-(void)testing3;
-(void)testing4;
@end

@protocol Protocol1 <NSObject>
-(void)aMethod;
@end
@protocol Protocol2 <NSObject>
-(void)aMethod1;
@end
@protocol Protocol3 <NSObject>
-(void)aMethod2;
@end
@protocol Protocol4 <NSObject>
-(void)aMethod3;
@end
@protocol Protocol5 <NSObject>
-(void)aMethod4;
@end
