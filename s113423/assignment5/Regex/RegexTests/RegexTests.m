//
//  RegexTests.m
//  RegexTests
//
//  Created by Salvador Jacobi on 21/01/13.
//  Copyright (c) 2013 Salvador Jacobi. All rights reserved.
//

#import "RegexTests.h"

@implementation RegexTests

- (void)setUp {
  [super setUp];

  // Set-up code here.
}

- (void)tearDown {
  // Tear-down code here.

  [super tearDown];
}

- (void)testInvalidPattern {
  NSError* error = NULL;
  [RegexPattern compileRegularExpression:@"a*b)" error:&error];
  STAssertNotNil(error, @"Pattern should be invalid: Mismatched parenthesis");
}

- (void)testPatternAndMatches {
  NSError* error = NULL;
  RegexPattern* p = [RegexPattern compileRegularExpression:@"a*b" error:&error];
  STAssertNil(error, @"Pattern should be valid");

  Matcher* m = [p matcherWithInput:@"aaaab"];
  STAssertTrue([m matches], @"Should match");

  m = [p matcherWithInput:@"aacab"];
  STAssertFalse([m matches], @"Should not match");
}

- (void)testMatchesWithRegion {
  NSError* error = NULL;
  RegexPattern *p = [RegexPattern compileRegularExpression:@"cats?" error:&error];
  STAssertNil(error, @"Pattern should be valid");

  Matcher* m = [p matcherWithInput:@"cats and dogs"];
  STAssertFalse([m matches], @"Should not match: Must match whole region");
  STAssertEquals([m regionStart], (NSUInteger)0, @"Region start should be 0");
  STAssertEquals([m regionEnd], (NSUInteger)13, @"Region end should be 13");

  [m setRegionFromIndex:0 toIndex:2];
  STAssertFalse([m matches], @"Should not match: Region = 'ca'");
  STAssertEquals([m regionStart], (NSUInteger)0, @"Region start should be 0");
  STAssertEquals([m regionEnd], (NSUInteger)2, @"Region end should be 2");

  [m setRegionFromIndex:0 toIndex:3];
  STAssertTrue([m matches], @"Should match: Region = 'cat'");
  STAssertEquals([m regionStart], (NSUInteger)0, @"Region start should be 0");
  STAssertEquals([m regionEnd], (NSUInteger)3, @"Region end should be 3");

  [m setRegionFromIndex:0 toIndex:4];
  STAssertTrue([m matches], @"Should match: Region = 'cats'");
  STAssertEquals([m regionStart], (NSUInteger)0, @"Region start should be 0");
  STAssertEquals([m regionEnd], (NSUInteger)4, @"Region end should be 4");

  [m setRegionFromIndex:1 toIndex:4];
  STAssertFalse([m matches], @"Region should prevent match");
  STAssertEquals([m regionStart], (NSUInteger)1, @"Region start should be 1");
  STAssertEquals([m regionEnd], (NSUInteger)4, @"Region end should be 4");
}

- (void)testGroups {
  NSError* error = NULL;
  RegexPattern* p = [RegexPattern compileRegularExpression:@"@interface ([A-Z][A-Za-z]+) : ([A-Z][A-Za-z]+)(?: <([A-Z][A-Za-z]+)>)?" error:&error];
  STAssertNil(error, @"Pattern should be valid");
  
  Matcher* m = [p matcherWithInput:@"@interface Matcher <MatchResult>"];
  STAssertFalse([m matches], @"Should not match");
  STAssertEquals((NSUInteger)3, [m groupCount], @"There should be 3 groups");
  STAssertThrowsSpecific([m group], NSException, @"No match made");
  STAssertThrowsSpecificNamed([m group], NSException, NSInternalInconsistencyException, @"No match made");

  [m resetWithInput:@"@interface Matcher : NSObject"];
  STAssertTrue([m matches], @"Should match");
  STAssertEquals((NSUInteger)3, [m groupCount], @"There should be 3 groups");
  STAssertEqualObjects(@"@interface Matcher : NSObject", [m group], @"The whole input string");
  STAssertEqualObjects(@"@interface Matcher : NSObject", [m groupWithIndex:0], @"The whole input string");
  STAssertEqualObjects(@"Matcher", [m groupWithIndex:1], @"The first group");
  STAssertEqualObjects(@"NSObject", [m groupWithIndex:2], @"The second group");
  STAssertEqualObjects(nil, [m groupWithIndex:3], @"The third group: Not found");
  
  [m resetWithInput:@"@interface Matcher : NSObject <MatchResult>"];
  STAssertTrue([m matches], @"Should match");
  STAssertEquals((NSUInteger)3, [m groupCount], @"There should be 3 groups");
  STAssertEqualObjects(@"@interface Matcher : NSObject <MatchResult>", [m group], @"The whole input string");
  STAssertEqualObjects(@"@interface Matcher : NSObject <MatchResult>", [m groupWithIndex:0], @"The whole input string");
  STAssertEqualObjects(@"Matcher", [m groupWithIndex:1], @"The first group");
  STAssertEqualObjects(@"NSObject", [m groupWithIndex:2], @"The second group");
  STAssertEqualObjects(@"MatchResult", [m groupWithIndex:3], @"The third group");
  
  STAssertThrowsSpecificNamed([m groupWithIndex:4], NSException, NSRangeException, @"No such group");
}

- (void)testReset {
  NSError* error = NULL;
  RegexPattern* p = [RegexPattern compileRegularExpression:@"two" error:&error];
  STAssertNil(error, @"Pattern should be valid");

  Matcher* m = [p matcherWithInput:@"one two three"];
  STAssertFalse([m matches], @"Should not match");

  [m setRegionFromIndex:4 toIndex:7];
  STAssertTrue([m matches], @"Should match");

  [m reset];
  STAssertFalse([m matches], @"Should not match");
}

- (void)testChangeOfPattern {
  NSError* error = NULL;
  RegexPattern* p = [RegexPattern compileRegularExpression:@"(.+) (.+) (.+)" error:&error];
  STAssertNil(error, @"Pattern should be valid");

  Matcher* m = [p matcherWithInput:@"one two three"];
  STAssertTrue([m matches], @"Should match");
  STAssertEquals((NSUInteger)3, [m groupCount], @"There should be 3 groups");
  STAssertEqualObjects(@"one", [m groupWithIndex:1], @"The first group");
  STAssertEqualObjects(@"two", [m groupWithIndex:2], @"The second group");
  STAssertEqualObjects(@"three", [m groupWithIndex:3], @"The third group");

  m.pattern = [RegexPattern compileRegularExpression:@"one t(.+) (.+)" error:&error];
  STAssertTrue([m matches], @"Should match");
  STAssertEquals((NSUInteger)2, [m groupCount], @"There should be 2 groups");
  STAssertEqualObjects(@"wo", [m groupWithIndex:1], @"The first group");
  STAssertEqualObjects(@"three", [m groupWithIndex:2], @"The second group");

  m.pattern = [RegexPattern compileRegularExpression:@"one three (.+)" error:&error];
  STAssertFalse([m matches], @"Should not match");
  STAssertEquals((NSUInteger)1, [m groupCount], @"There should be 1 group");
}

@end
