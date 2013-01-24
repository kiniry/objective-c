//
//  AddViewController.h
//  Assignment3
//
//  Created by Markus Færevaag on 21.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CitizenViewController.h"
#import "Citizen.h"
#import "Nobleperson.h"

@interface AddViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic) Citizen *citizen;
@property (nonatomic) NSMutableArray *dictArray;

@end
