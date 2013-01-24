//
//  DetailViewController.m
//  Assignment3
//
//  Created by Markus Færevaag on 17.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize label, citizen, dictArray;

// Init
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Name
    self.label.text = [NSString stringWithFormat:@"   %@", self.citizen.name];
    
    // Info
    if (!self.citizen.spouse) {
        self.citizen.spouse = [[Citizen alloc] initWithName:@"" andSex:(Sex)nil andAge:(int)nil];
    }
    
    NSArray *keys = [NSArray arrayWithObjects:@"Sex", @"Age", @"Spouse", nil];
    NSArray *objects = [NSArray arrayWithObjects:
                        [Citizen sexToString:self.citizen.sex],
                        [NSString stringWithFormat:@"%d", self.citizen.age],
                        self.citizen.spouse.name,
                        nil];
    self.dictArray = [NSMutableArray arrayWithObject:[NSDictionary dictionaryWithObjects:objects forKeys:keys]];
    
    // Parents
    [self.dictArray addObject:[DetailViewController indexKeyedDictionaryFromArray:[self.citizen.parents allObjects]]];
    
    // Children
    [self.dictArray addObject:[DetailViewController indexKeyedDictionaryFromArray:[self.citizen.children allObjects]]];
}

// Table contents
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    int sectionIdx = [indexPath indexAtPosition:0];
    int idx = [indexPath indexAtPosition:1];
    NSString *key = [[[self.dictArray objectAtIndex:sectionIdx] allKeys] objectAtIndex:idx];
    NSString *value = [[self.dictArray objectAtIndex:sectionIdx] objectForKey:key];
    
    if (sectionIdx == 0) cell.textLabel.text = key;
    else cell.textLabel.text = @"Citizen";
    cell.detailTextLabel.text = value;
    
    [cell setUserInteractionEnabled:NO]; // Unselectable
    
    return cell;
}

// Section names
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 1:
            sectionName = [NSString stringWithFormat:@"Parents"];
            break;
        case 2:
            sectionName = [NSString stringWithFormat:@"Children"];
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

// Number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dictArray count];
}

// Number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dictArray objectAtIndex:section] count];
}

// Array to dictionary
+ (NSDictionary *) indexKeyedDictionaryFromArray:(NSArray *)array
{
    id objectInstance;
    NSUInteger indexKey = 0;
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
    for (objectInstance in array)
    {
        Citizen *c = (Citizen *)objectInstance;
        [mutableDictionary setObject:c.name forKey:[NSNumber numberWithUnsignedInt:indexKey++]];
    }
    
    return (NSDictionary *) mutableDictionary;
}

- (IBAction)btnMarry:(id)sender {
    [self.citizen marryTo:<#(Citizen *)#>]
}

- (IBAction)btnDivorce:(id)sender {
}

- (IBAction)btnParent:(id)sender {
}

- (IBAction)btnChild:(id)sender {
}
@end
