//
//  Blocks.m
//  Blocks
//
//  Created by Sivanujann Selliah on 24/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Blocks.h"

@interface Blocks ()

@property (nonatomic, copy) void (^smallBlock)(void);
@property (nonatomic, copy) void (^largeBlock)(void);

@property (nonatomic, copy) void (^internalVariableBlock)(void);
@property (nonatomic, copy) void (^externalVariableBlock)(void);

@property (nonatomic, copy) void (^boundPrimitiveTypeBlock)(void);
@property (nonatomic, copy) void (^boundReferenceTypeBlock)(void);

@property (nonatomic, copy) void (^freePrimitiveTypeBlock)(void);
@property (nonatomic, copy) void (^freeReferenceTypeBlock)(void);

@end

@implementation Blocks

-(id)init
{
    self = [super init];
    if(self)
    {
        self.smallBlock = ^{
            int t = 1;
            t = 2;
        };
        self.largeBlock = ^{
            int t = 1;
            t = 2;
            t = 3;
            t = 4;
            t = 5;
            t = 6;
            t = 7;
            t = 8;
            t = 9;
            t = 10;
        };
        
        __block NSString *aExternalVariable = @"Testing";
        self.internalVariableBlock = ^{
            NSString *aInternalVariable = @"Testing";
        };
        self.externalVariableBlock = ^{
            aExternalVariable = @"Testing";
        };
        
        int primitiveValue = 2;
        NSNumber *refernceVariable = @2;
        self.boundPrimitiveTypeBlock = ^{
            int useOfPrimitiveValue = primitiveValue;
        };
        self.boundReferenceTypeBlock = ^{
            NSNumber *useOfReferenceVariable = refernceVariable;
        };
        
        self.freePrimitiveTypeBlock = ^{
            int t = 2;
        };
        self.freeReferenceTypeBlock = ^{
            NSNumber *t = @2;
        };
    }
    
    return self;
}

-(void)useSmallBlock
{
    self.smallBlock();
}
-(void)useLargeBlock
{
    self.largeBlock();
}

+(void)declareAndCallBlockWithBoundVariables
{
    int t = 2;
    void (^testBlock)(void) = ^{
        t*2;
    };
    
    testBlock();
}
+(void)declareAndCallBlockWithInternalVariables
{
    void (^testBlock)(void) = ^{
        int t = 2;
        t*2;
    };
    
    testBlock();
}

-(void)useInternalVariablesInBlock
{
    self.internalVariableBlock();
}
-(void)useExternalVariablesInBlock // not bound variables, but references using __block
{
    self.externalVariableBlock();
}

-(void)useBoundPrimitiveTypeInBlock
{
    self.boundPrimitiveTypeBlock();
}
-(void)useBoundReferenceTypeInBlock
{
    self.boundReferenceTypeBlock();
}

-(void)useFreePrimitiveTypeInBlock
{
    self.freePrimitiveTypeBlock();
}
-(void)useFreeReferenceTypeInBlock
{
    self.freeReferenceTypeBlock();
}

@end
