//
//  AddViewController.h
//  Assignment3
//
//  Created by Markus Færevaag on 21.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Citizen.h"

@interface AddViewController : UIViewController

@property (nonatomic) Citizen *citizen;

@property (nonatomic) NSMutableArray *dictArray;

@end
