//
//  main.m
//  Assignment5
//
//  Created by Andreas Graulund on 25/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmartyPantsParser.h"
//#import "NSRegularExpression+Split.h"
#import "NSMutableString+RegularExpression.h"

// Quick macro to help get rid of repetitive things in main.m
#define LOG_TEST_RUN(number,testString,resultString) NSLog(@"TEST RUN %d\nBefore: %@\nAfter:  %@\n\n", number, testString, resultString);

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		NSString *testString;
		NSString *resultString;
		
		// PORTED VERSION OF "SmartyPants" ===============================================================
		
		// TEST RUN 1 ------------------------------------------------------------------------------------
		
		// Transforming a string by creating a parser object:
		
		testString = @"\"Isn't it great?\"";
		
		SmartyPantsParser *sp = [[SmartyPantsParser alloc] init];
		resultString = [sp transformString:testString];
		
		LOG_TEST_RUN(1, testString, resultString);
		
		// TEST RUN 2 ------------------------------------------------------------------------------------
		
		// Transforming a string by using a class method shortcut:
		
		testString = @"Look -- it's shiny!";
		
		resultString = [SmartyPantsParser transformString:testString];
		
		LOG_TEST_RUN(2, testString, resultString);
		
		// TEST RUN 3 ------------------------------------------------------------------------------------
		
		// Transforming a string using a numeric argument (documented in the original API):
		
		testString = @"Shorter dash -- and a longer dash --- values chosen by arguments.";
		
		sp = [[SmartyPantsParser alloc] initWithAttributes:2];
		resultString = [sp transformString:testString];
		
		LOG_TEST_RUN(3, testString, resultString);
		
		// TEST RUN 4 ------------------------------------------------------------------------------------
		
		// Transforming a string using a an argument string (documented in the original API):
		
		testString = @"It's not ``modifying'' characters inside <a href=\"http://example.com/\">`HTML' elements</a>...";
		
		resultString = [SmartyPantsParser transformString:testString usingAttributeString:@"qBe"];
		
		LOG_TEST_RUN(4, testString, resultString);
		
		// TEST RUN 5 ------------------------------------------------------------------------------------
		
		// Using a shorthand that only modifies a certain subset of modifiable characters.
		// In this case, "SmartQuotes" for only quotes.
		
		testString = @"This shorthand is only modifying \"quotes\", not dashes -- and that's a fact!";
		
		resultString = [SmartyPantsParser smartQuotes:testString];
		
		LOG_TEST_RUN(5, testString, resultString);
		
		// TEST RUN 6 ------------------------------------------------------------------------------------
		
		// Contents of code blocks (such as <pre> tags) are unchanged:
		
		testString = @"It's also not modifying characters inside code blocks. <pre> self.crazy = @\"true\"; </pre>";
		
		resultString = [SmartyPantsParser transformString:testString];
		
		LOG_TEST_RUN(6, testString, resultString);
	    
	}
    return 0;
}

