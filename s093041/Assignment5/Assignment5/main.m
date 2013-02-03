//
//  main.m
//  Assignment5
//
//  Created by Philip Nielsen on 22/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "JSONConvert.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *json = @"{\"person\" : {\"AGE\" : \"24\", \"nAme\" : \"Philip\", \"nonExistingProperty\" : \"20\", \"Assets\" : \"20\"}}";
        
        NSLog(@"Deserialized result:\t%@", [JSONConvert deserializeJSONObjectFromString:json forType:[Person class]]);
        
        NSLog(@"Serialized result:\t%@", [JSONConvert serializeObject:[[Person alloc] initWithName:@"Josepgh" age:40 assests:20.5]]);
    }
    return 0;
}