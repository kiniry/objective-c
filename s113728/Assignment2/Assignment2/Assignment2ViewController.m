//
//  Assignment2ViewController.m
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "Assignment2ViewController.h"
#import "EarthModel.h"

@interface Assignment2ViewController ()
@property (nonatomic) NSInteger *population;
@property (nonatomic, strong) EarthModel *earthModel;
@end

@implementation Assignment2ViewController

@synthesize display = _display;
@synthesize population = _population;
@synthesize earthModel = _earthModel;
- (EarthModel *)earthModel  {
    if (!_earthModel) [[EarthModel alloc] init];
    return _earthModel;
}
- (IBAction)personPressed:(UIButton *)sender {
    [self.earthModel pushPerson:[/* CITIZEN CODE HERE*/]];
}
- (IBAction)actionPressed:(UIBarButtonItem *)sender {
    [self.earthModel 
}


- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
