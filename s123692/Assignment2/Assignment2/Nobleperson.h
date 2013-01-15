//
//  Nobleperson.h
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface Nobleperson : Citizen
{
    NSNumber* _assets;
    Citizen* _butler;
}

@property (nonatomic) NSNumber* assets;
@property (nonatomic) Citizen* butler;

-(void) setAssets:(NSNumber *)assets;

@end
