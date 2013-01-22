//
//  Nobleperson.h
//  Assignment3-Logging
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
@property Citizen* butler;

-(void) setAssets:(NSNumber *)assets;
-(void) setAssetsWithoutSharing:(NSNumber *)assets;


@end
