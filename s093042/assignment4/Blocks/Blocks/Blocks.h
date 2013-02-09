//
//  Blocks.h
//  Blocks
//
//  Created by Sivanujann Selliah on 24/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Blocks : NSObject

-(void)useSmallBlock;
-(void)useLargeBlock;

+(void)declareAndCallBlockWithBoundVariables;
+(void)declareAndCallBlockWithInternalVariables;

-(void)useInternalVariablesInBlock;
-(void)useExternalVariablesInBlock; // not bound variables, but references using __block

-(void)useBoundPrimitiveTypeInBlock;
-(void)useBoundReferenceTypeInBlock;

-(void)useFreePrimitiveTypeInBlock;
-(void)useFreeReferenceTypeInBlock;

@end
