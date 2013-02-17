//
//  NoblePerson.m
//  Assignment2_1
//
//  Created by Carsten Nilsson on 16/01/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import "NoblePerson.h"
// Removes timestamps from console to make it clean.
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


@implementation NoblePerson

@synthesize assets = _assets;
@synthesize butler = _butler;

-(id)initWithName:(NSString *)aName
              Sex:(NSString *)aSex
              Age:(int) anAge
           Assets:(int) assets
           Butler:(Citizen *) aButler
{
    if(self = [super init]) {
        self.name = aName;
        self.sex = aSex;
        self.age = anAge;
        self.assets = assets;
        self.butler = aButler;

        NSLog(@"NoglePerson InitWithName: %@, Sex: %@, Age: %d, Assets: %d, Butler: %@", self.name, self.sex, self.age, self.assets, self.butler.name);
    }
    return self;
}

// Override
- (void)marryWith:(Citizen *) aCitizen {
    
    NoblePerson *noblePerson = (NoblePerson *) aCitizen;
    
    BOOL ofNobleStatus = [aCitizen isKindOfClass:[NoblePerson class]] && (noblePerson.butler);
    
    if (aCitizen && [self impedimentToMarriage:aCitizen] && ofNobleStatus){
        self.spouse = aCitizen;
        self.spouse.spouse = self;
        self.assets += noblePerson.assets;
        noblePerson.assets = self.assets;
        NSLog(@"%@ married to %@.",self.name, aCitizen.name);
    } else {
        if(!ofNobleStatus) NSLog(@"The chosen one: %@ is not of noble status.", aCitizen.name);
        NSLog(@"%@ could not be married to %@.",self.name, aCitizen.name);
    }
}

// Override
- (void) divorce {
    if (self.single == NO){
        NSLog(@"%@ got divorced to %@.",self.name, self.spouse.name);
        
        // Share their assets!
        self.assets /= 2;
        NoblePerson *noblePerson = (NoblePerson *) self.spouse;
        noblePerson.assets /= 2;
        
        // Divorce!
        self.spouse.spouse = nil;
        self.spouse = nil;
    } else {
        NSLog(@"%@ is single.",self.name);
    }
}

// Override
- (NSString *) description {
    return [NSString stringWithFormat:@"Name: %@, Sex: %@, Age: %d, Single: %d, Spouse: %@, Assets: %d, Butler: %@", self.name, self.sex,self.age,self.single, self.spouse.name, self.assets, self.butler.name];
}

@end
