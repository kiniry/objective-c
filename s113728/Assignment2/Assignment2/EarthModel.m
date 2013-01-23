//
//  EarthModel.m
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "EarthModel.h"
//#import "Citizen.h"

@interface EarthModel()
@property (nonatomic, strong) NSMutableArray *personStack;
@end

@implementation EarthModel

@synthesize somePeople = _somePeople;
@synthesize personStack = _personStack;

- (NSMutableArray *)personStack {
    if (!_personStack) _personStack = [[NSMutableArray alloc] init];
    return _personStack;
}
- (void)pushPerson:(Citizen *)person {
    [self.personStack addObject:person];
}
- (Citizen *)popPerson {
    Citizen *poppedPerson = [self.personStack lastObject];
    if (poppedPerson) {
        [self.personStack removeLastObject];
    }
    return poppedPerson;
}
- (void)performOperation:(NSString *)operation {
    if ([operation isEqualToString:@"marry"]) {
        [ [self popPerson] marry:[self popPerson] ];
    } else if ([operation isEqualToString:@"divorce"]) {
        [ [self popPerson] divorce:[self popPerson]];
    } else if ([operation isEqualToString:@"breed"]){
            // TODO
    }
}

@end
