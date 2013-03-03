//
//  Card.h
//  Matchismo
//
//  Created by Jakob Jakobsen Boysen on 21/02/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong) NSString *contents;

@property (getter = isFaceUp) BOOL faceUp;
@property (getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
