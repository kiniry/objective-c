//
//  Citizen.m
//  assignment2
//
//  Created by Radu Gatej on 1/13/13.
//  Copyright (c) 2013 Radu Gatej. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize children = _children;
@synthesize parents = _parents;


-(Citizen *)init:(NSString *)name sex:(Sex)sex age:(unsigned int)age {
    self = [super init];
    self.name = name;
    self.sex = sex;
    self.children = [[NSArray alloc] init];
    self.parents = [[NSArray alloc] init];
    
    return self;
}
-(void)marry:(Citizen *)citizen {
    
    if([self canMarry:citizen] && [citizen canMarry:self]) {
        self.spouse = citizen;
        citizen.spouse = self;
    }
}

-(BOOL)single {
    return self.spouse == nil;
}

-(BOOL)canMarry:(Citizen *)citizen {
    if(!citizen.single) return NO;
    if(!citizen.sex == self.sex) return NO;
    if([self.children containsObject:citizen] || [self.parents containsObject:citizen]) return NO;
    if(self.spouse != nil) return NO;
    
    return YES;
    
}

-(void)setParents:(NSArray *)parents {
    if(parents.count <=2) {
        _parents = parents;
    }
}

-(void)divorce {
    self.spouse = nil;
}

-(BOOL)meetsConstraints {
    if(![self.children containsObject:self]) return NO;
    for (Citizen *child in self.children)
         if(![child.parents containsObject:self]) return NO;
    for (Citizen *parent in self.parents)
         if(![parent.children containsObject:self]) return NO;
    return YES;
}

@end
