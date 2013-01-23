//
//  Citizen.m
//  assignment2
//
//  Created by Magloire on 1/16/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

/*
 The idea of synthesize is almost similar to Ruby with some minor differences.
 
 attr_accessor :first_name, :last_name would generate getter and setters in Ruby. attr_reader would generate readonly properties.
 
 In Ruby, you don't declare instance variables before in a header file. An instance variables declared inside a method, like @last_name, would be accessible outside that method as well.
 
 @property (nonatomic)  be nice if properties could be synthesized automatically. I don't why see why @property lastName in a header file and @synthesize lastName in implementation file are both needed.
 */

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize single = _single;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;


-(id) initWithFirstName:(NSString *)firstName andLastName:(NSString *) lastName{
    self = [super init];
    
    if(self){
        _firstName = firstName;
        _lastName = lastName;
        return self;
    }else{
        return nil;
    }
}

-(void) addChild:(Citizen *)child{
    
}

-(void) addParent:(Citizen *)parent{
    
}

-(void) setParents:(NSMutableSet *)parents{
    // check invariants: parents = 2
    NSAssert([parents count] == 2, @"parents must be exactly 2");
    _parents = parents;
    
}

-(void) setChildren:(NSMutableSet *)children{
    //NSArray *arr = [children allObjects]
    
    for (Citizen *c in children) {

        NSAssert(!c.parents , @"You cannot add a child who already has parents ");
    }
    
    _children = children;

}

-(BOOL)isSingle{
    return self.spouse == nil;
    
}

-(void) marry:(Citizen *)sweetHeart{
    NSAssert([self canMarry:sweetHeart], @"invalid marriage");
    self.spouse = sweetHeart;
    sweetHeart.spouse = self;
}

-(void) divorce{
    NSAssert(self.isSingle, @"must be single!!!");
    self.spouse = nil;  // set the spouse to void
    self.spouse.spouse = nil; // the spouse is divorced as well
}

-(BOOL) canMarry:(Citizen *)sweetHeart{
    if (!sweetHeart) {
        NSLog(@"fiance is  null");
        return false;
    }
    
    return self.isSingle && ![self.children containsObject:sweetHeart]
    && ![self.parents containsObject:sweetHeart]
    && self.sex != sweetHeart.sex;
}

@end
