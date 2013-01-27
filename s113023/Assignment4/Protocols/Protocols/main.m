//
//  main.m
//  Protocols
//
//  Created by Andreas Haure on 27/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Proto1.h"
#import "Proto2.h"
#import "Proto3.h"
#import "Proto4.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //-------------------------------\\
        //     Class with no protocol    \\
        //----------------------------------------------------------------------------------------------------------------//

        NSLog(@"Calling instance method with no protocols started");
        NSDate *start = [NSDate date];
        Proto1 *instance1 = [[Proto1 alloc] init];
        [instance1 sayStuff];
        double timePassedNoProtocol = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Calling instance method with no protocols finished");
        
        //--------------------------------------\\
        //     Class with one small protocol    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Calling instance method with one small protocol started");
        start = [NSDate date];
        Proto2 *instance2 = [[Proto2 alloc] init];
        [instance2 sayStuff];
        double timePassedOneSmallProtocol = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Calling instance method with one small protocol finished");
        
        //--------------------------------------\\
        //     Class with one large protocol    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Calling instance methods from one long protocol started");
        start = [NSDate date];
        Proto3 *pulpFiction = [[Proto3 alloc] init];
        
        [pulpFiction and];
        [pulpFiction i];
        [pulpFiction will];
        [pulpFiction strike];
        [pulpFiction down];
        [pulpFiction upon];
        [pulpFiction thee];
        [pulpFiction with];
        [pulpFiction great];
        [pulpFiction vengeance];
        [pulpFiction and];
        [pulpFiction furious];
        [pulpFiction anger];
        [pulpFiction those];
        [pulpFiction who];
        [pulpFiction attempt];
        [pulpFiction to];
        [pulpFiction poisen];
        [pulpFiction and];
        [pulpFiction destroy];
        [pulpFiction my];
        [pulpFiction brothers];
        [pulpFiction and];
        [pulpFiction you];
        [pulpFiction will];
        [pulpFiction know];
        [pulpFiction my];
        [pulpFiction name];
        [pulpFiction is];
        [pulpFiction the];
        [pulpFiction lord];
        [pulpFiction when];
        [pulpFiction i];
        [pulpFiction lay];
        [pulpFiction my];
        [pulpFiction vengeance];
        [pulpFiction upon];
        [pulpFiction you];
         
        double timePassedOneLongProtocol = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Calling instance methods from one long protocol finished");
        
        //----------------------------------\\
        //     Class with many protocols    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Calling  instance methods with many protocols started");
        start = [NSDate date];
        Proto4 *pulpFiction2 = [[Proto4 alloc] init];
        
        [pulpFiction2 and];
        [pulpFiction2 i];
        [pulpFiction2 will];
        [pulpFiction2 strike];
        [pulpFiction2 down];
        [pulpFiction2 upon];
        [pulpFiction2 thee];
        [pulpFiction2 with];
        [pulpFiction2 great];
        [pulpFiction2 vengeance];
        [pulpFiction2 and];
        [pulpFiction2 furious];
        [pulpFiction2 anger];
        [pulpFiction2 those];
        [pulpFiction2 who];
        [pulpFiction2 attempt];
        [pulpFiction2 to];
        [pulpFiction2 poisen];
        [pulpFiction2 and];
        [pulpFiction2 destroy];
        [pulpFiction2 my];
        [pulpFiction2 brothers];
        [pulpFiction2 and];
        [pulpFiction2 you];
        [pulpFiction2 will];
        [pulpFiction2 know];
        [pulpFiction2 my];
        [pulpFiction2 name];
        [pulpFiction2 is];
        [pulpFiction2 the];
        [pulpFiction2 lord];
        [pulpFiction2 when];
        [pulpFiction2 i];
        [pulpFiction2 lay];
        [pulpFiction2 my];
        [pulpFiction2 vengeance];
        [pulpFiction2 upon];
        [pulpFiction2 you];
        
        double timePassedManyProtocols = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Calling  instance methods with many protocols finished");
        
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Time spent calling instance method with no protocols: %f",timePassedNoProtocol);
        NSLog(@"Time spent calling instance method with one protocol: %f",timePassedOneSmallProtocol);
        NSLog(@"Time spent calling several instance methods with one long protocol: %f",timePassedOneLongProtocol);
        NSLog(@"Time spent calling several instance methods with many protocols: %f",timePassedManyProtocols);
    }
    return 0;
}

