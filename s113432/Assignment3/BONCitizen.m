//
//  BONCitizen.m
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONCitizen.h"
#import "BONNoble.h"

@implementation BONCitizen
@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize hasSpouse = _hasSpouse;
@synthesize spouse = _spouse;
@synthesize hasChildren = _hasChildren;
@synthesize children = _children;
@synthesize parent1 = _parent1;
@synthesize parent2 = _parent2;

+ (id) create {
    return [[self alloc] init];
}

+ (id) createWithName: (NSString*) name{
    return [[self alloc] initWithName: name];
}

- (BONCitizen *)spouse {
    if (!_spouse){
        _spouse = [[BONCitizen alloc]init];
    }
    return _spouse;
}

- (NSString *)sex {
    if (!_sex){
        _sex = [[NSString alloc]init];
        _sex = @"alien";
    }
    return _sex;
}

- (BONCitizen *)parent1 {
    if (!_parent1){
        _parent1 = [[self.class alloc]init];
    }
    return _parent1;
    
}

- (BONCitizen *)parent2 {
    if (!_parent2){
        _parent2 = [[self.class alloc]init];
    }
    return _parent2;
}

- (int) age{
    if (!_age){
        _age = [[NSString alloc]init];
    }
    return _age;
}

- (void) setSexWithAssertion: (NSString*) sex{
    NSAssert([sex isEqualToString: @"male"] || [sex isEqualToString: @"female"] || [sex isEqualToString: @"alien"] || [sex isEqualToString: @"programmer"], @"Invalid sex. Please specify either male or female.");
    self.sex = sex;
}

- (void) setNameWithAssertion: (NSString*) name{
    NSAssert(![name isEqualToString: @""], @"Please set a valid name.")
    self.sex = sex;
}

- (int) setAgeWithAssertion: (int) age{
    NSAssert(0 < age < 110, @"Age is set to a nonvalid number. Please set an age between 0 and 110.");
    self.age = age;
}

- (void) setSexWithException: (NSString*) sex{
    if(!([sex isEqualToString: @"male"] || [sex isEqualToString: @"female"] || [sex isEqualToString: @"alien"] || [sex isEqualToString: @"programmer"])){
        [NSException raise:@"Invalid sex" format: @"Sex is not male or female", sex];
    }
    self.sex = sex;
}

- (void) setNameWithException: (NSString*) name{
    if([name isEqualToString: @""]){
        [NSException raise: @"Invalid name" format:@"Name is blank", name];
    }
    self.sex = sex;
}

- (int) setAgeWithException: (int) age{
    if(!(0 < age < 110)){
        [NSException raise: @"Invalid age" format: @"Age should be between 0 and 110", age]
    }
    self.age = age;
}

- (void) setSexWithLogging: (NSString*) sex{
    if(!([sex isEqualToString: @"male"] || [sex isEqualToString: @"female"] || [sex isEqualToString: @"alien"] || [sex isEqualToString: @"programmer"])){
        sysLog(@"Sex was set to an invalid value, should be male or female.");
        
    }
    self.sex = sex;
}

- (void) setNameWithLogging: (NSString*) name{
    if(!([name isEqualToString: @""])){
        NSLog(@"Name was set to null.");
    }
    self.name = name;
}

- (int) setAgeWithLogging: (int) age{
    if(!(0 < age < 110)){
         NSLog(@"Age was set to invalid value, should be between 0 and 110.");
    }
    self.age = age;
}

- (id)init {
    return [self initWithName nil];
}

- (id)initWithName:(NSString*)name{
    if (self = [super init]){
        self setNameWithAssertion:<#(NSString *)#> name;
    }
    return self;
}

- (bool) marryWithAssert:(BONCitizen *)personToMarry{
    if (![personToMarry.sex isEqualToString: self.sex]){
        if (personToMarry.age > 18) {
            if (!self.hasSpouse) {
                if (!personToMarry.hasSpouse) {
                    if (![personToMarry.parent1.name isEqualToString: self.name] && ![personToMarry.parent2.name isEqualToString: self.name] && ![self.parent1.name isEqualToString: personToMarry.name] && ![self.parent2.name isEqualToString: personToMarry.name]){
                        if (![self.parent1.name isEqualToString: personToMarry.parent1.name] && ![self.parent2.name isEqualToString: personToMarry.parent2.name] && ![self.parent1.name isEqualToString: personToMarry.parent2.name] && ![self.parent2.name isEqualToString: personToMarry.parent2.name]){
                            if (self.class == personToMarry.class){
                                self.spouse = personToMarry;
                                self.hasSpouse = YES;
                                personToMarry.spouse = self;
                                personToMarry.hasSpouse = YES;
                                NSAssert(self.spouse = personToMarry), @"The marriage has failed, and causality is shattered. Something has gone terribly wrong.");
                                return YES;
                            }
                        }
                    }
                }
            }
        }
    }
    return NO;
}


- (bool) divorce{
    if (self.hasSpouse){
        self.spouse.spouse = nil;
        self.spouse.hasSpouse = NO;
        self.spouse = nil;
        self.hasSpouse = NO;
        return true;
        NSAssert(self.spouse = nil), @"The divorce has failed, and causality is shattered. Something has gone terribly wrong.");
    }
    return false;
}
@end