//
//  BlocksCollectionOfBlocks.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 21/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "BlocksCollectionOfBlocks.h"

@implementation BlocksCollectionOfBlocks
- (id)init
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary *blockDisplays = [[NSMutableDictionary alloc] init];
        
        blockDisplayChoice_t blockDisplayFirstName;
        blockDisplayFirstName = ^(Citizen *person, BOOL *stop)
        {
            NSLog(@"blockDisplayFirstName: %@",person.firstName);
        };
        
        blockDisplayChoice_t blockDisplayLastName;
        blockDisplayLastName = ^(Citizen *person, BOOL *stop)
        {
            NSLog(@"blockDisplayFirstName: %@",person.lastName);
        };
        
        blockDisplayChoice_t blockDisplayAge;
        blockDisplayAge = ^(Citizen *person, BOOL *stop)
        {
            NSLog(@"blockDisplayAge: %@",person.age);
        };
        [blockDisplays setObject:(blockDisplayChoice_t)blockDisplayFirstName forKey:@"blockDisplayFirstName"];
        [blockDisplays setObject:(blockDisplayChoice_t)blockDisplayLastName forKey:@"blockDisplayLastName"];
        [blockDisplays setObject:(blockDisplayChoice_t)blockDisplayAge forKey:@"blockDisplayAge"];
        
        self.blockDisplays = blockDisplays;
        
        NSLog(@"%@", blockDisplays);

        
    }
    return self;
}
// iterate over a dict of blocks executing them one at a time on same method and person
- (void)goOverDictOfBlock:(NSMutableDictionary *)dictOfBlock{
    
    NSLog(@"%@", dictOfBlock);

    BlocksPeoplePool *inst = [[BlocksPeoplePool alloc] init];
    
    for (id key in dictOfBlock)
    {
        [inst choosePersonWithBlock:^(Citizen *person, BOOL *stop)
        {
            NSLog(@"person: %@", person);
            [dictOfBlock objectForKey:key];
        }
    ];}   
}


@end
