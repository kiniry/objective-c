//
//  NoblePerson.m
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import "NoblePerson.h"

@interface NoblePerson()

@property int capital;
@property (nonatomic)  Citizen * butler;

@end

@implementation NoblePerson

@synthesize capital = _capital;

- (int) capital
{
    if(!_capital) _capital = 0;
    return _capital;
}

- (void) setCapital:(int)capital
{
    _capital = capital;
}

- (void) setButtler:(Citizen *) buttler
{
    _butler = buttler;
}

- (BOOL) marry: (NoblePerson *) person
{
    // If neither has a butler, no marriage!
    if(!self.butler && !person.butler) {
        return nil;
    }
    
    // Divide loot (Substract marriage price)
    int capital = (self.capital + person.capital - 10000) / 2;
    self.capital = capital;
    person.capital = capital;
    
    return [super marry:person];
}


- (NSString *) description
{
    return [NSString stringWithFormat:@"%@; Capital: %i; Buttler: %@", [super description], self.capital, self.butler];
}
@end
