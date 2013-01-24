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

  p = [RegexPattern compileRegularExpression:@"(.) (..) (...)" error:&error];
  m = [p matcherWithInput:@"A BB CCC"];

  STAssertThrowsSpecificNamed([m groupWithIndex:2], NSException, NSInternalInconsistencyException, @"No match found yet");

  STAssertTrue([m matches], @"Should match");
  STAssertEquals((NSUInteger)3, [m groupCount], @"There's 3 groups");
  STAssertEqualObjects(@"A BB CCC", [m groupWithIndex:0], @"Group 0");
  STAssertEqualObjects(@"A", [m groupWithIndex:1], @"Group 1");
  STAssertEqualObjects(@"BB", [m groupWithIndex:2], @"Group 2");
  STAssertEqualObjects(@"CCC", [m groupWithIndex:3], @"Group 3");

  m.pattern = [RegexPattern compileRegularExpression:@". (.). .(..)" error:&error];

  STAssertEquals((NSUInteger)2, [m groupCount], @"Now there's only 2 groups");

  STAssertNil([m group], @"Should not throw, group should be nil");
  STAssertNil([m groupWithIndex:0], @"Should not throw, group 0 should be nil");
  STAssertNil([m groupWithIndex:1], @"Should not throw, group 1 should be nil");
  STAssertNil([m groupWithIndex:2], @"Should not throw, group 2 should be nil");

  STAssertEquals((NSUInteger)0, [m start], @"without group index it should return what it did before");
  STAssertEquals((NSUInteger)8, [m end], @"without group index it should return what it did before");

  STAssertThrowsSpecificNamed([m groupWithIndex:3], NSException, NSRangeException, @"There's no group 3");

  STAssertTrue([m matches], @"Should match");
  STAssertEquals((NSUInteger)2, [m groupCount], @"There's 2 groups");
  STAssertEqualObjects(@"A BB CCC", [m groupWithIndex:0], @"Group 0");
  STAssertEqualObjects(@"B", [m groupWithIndex:1], @"Group 1");
  STAssertEqualObjects(@"CC", [m groupWithIndex:2], @"Group 2");

  STAssertThrowsSpecificNamed(m.pattern = nil, NSException, NSInvalidArgumentException, @"Setting the pattern to nil should throw");
  
  STAssertNil(error, @"Pattern should be valid");
}

- (void)testFind {
  NSError* error = NULL;

  RegexPattern* p = [RegexPattern compileRegularExpression:@"\\b\\w{3}\\b" error:&error];
  Matcher* m = [p matcherWithInput:@"The quick brown fox jumps over the lazy dog"];

  NSMutableArray* threeLetterWords = [NSMutableArray array];
  NSMutableArray* starts = [NSMutableArray array];
  NSMutableArray* ends = [NSMutableArray array];
  while ([m find]) {
    [threeLetterWords addObject:[m group]];
    [starts addObject:@( [m start] )];
    [ends addObject:@( [m end] )];
  }

  NSArray* expectedWords = @[@"The", @"fox", @"the", @"dog"];
  STAssertTrue([expectedWords isEqualToArray:threeLetterWords], @"Find all three letter words");

  NSArray* expectedStarts = @[@0, @16, @31, @40];
  STAssertTrue([expectedStarts isEqualToArray:starts], @"Assert [m start] values");

  NSArray* expectedEnds = @[@3, @19, @34, @43];
  STAssertTrue([expectedEnds isEqualToArray:ends], @"Assert [m end] values"); 

  STAssertNil(error, @"All patterns should be valid");
}

- (void)testPositionState {
  NSError* error = NULL;

  RegexPattern* p = [RegexPattern compileRegularExpression:@".+?" error:&error];
  Matcher* m = [p matcherWithInput:@"Hello World"];

  STAssertTrue([m find], @"Find the first letter");
  STAssertEqualObjects(@"H", [m group], @"The first letter is H");
  STAssertTrue([m find], @"Find the second letter");
  STAssertEqualObjects(@"e", [m group], @"The second letter is e");
  STAssertTrue([m matches], @"The pattern matches the whole input");
  STAssertEqualObjects(@"Hello World", [m group], @"The match is Hello World");
  STAssertFalse([m find], @"The end has been reached: No more matches");

  STAssertThrowsSpecificNamed([m group], NSException, NSInternalInconsistencyException, @"[m find] returned false: No match found");

  [m resetWithInput:@"aaaaba"];

  STAssertTrue([m find], @"Find the first letter");
  STAssertEqualObjects(@"a", [m group], @"The first letter is a");
  STAssertEquals((NSUInteger)0, [m start], @"Start position is 0");
  STAssertEquals((NSUInteger)1, [m end], @"End position is 1");

  m.pattern = [RegexPattern compileRegularExpression:@"a+?" error:&error];

  STAssertFalse([m matches], @"Should not match");

  STAssertThrowsSpecificNamed([m group], NSException, NSInternalInconsistencyException, @"[m matches] returned false: [m group] should throw");
  STAssertThrowsSpecificNamed([m end], NSException, NSInternalInconsistencyException, @"[m matches] returned false: [m end] should throw");

  STAssertFalse([m hasHitEnd], @"End not reached yet");

  STAssertTrue([m find], @"Find the last letter");
  STAssertEqualObjects(@"a", [m group], @"The last letter is a");
  STAssertEquals((NSUInteger)5, [m start], @"Start position is 5");
  STAssertEquals((NSUInteger)6, [m end], @"End position is 6");

  STAssertFalse([m hasHitEnd], @"End still not reached");

  STAssertFalse([m find], @"No matches left");

  STAssertTrue([m hasHitEnd], @"End finally reached");

  STAssertNil(error, @"All patterns should be valid");
}

- (void)testNSStringMethods {
  NSError* error = NULL;

  STAssertTrue([@"something" matchesRegularExpression:@"[a-z]+thing" error:&error], @"Should match");
  STAssertFalse([@"anythang" matchesRegularExpression:@"[a-z]+thing" error:&error], @"Should not match");

  STAssertEqualObjects(@"dogs and dogs", [@"cats and dogs" stringByReplacingFirstOccurrenceOfRegularExpression:@"...s" withString:@"dogs" error:&error], @"Should replace cats with dogs");
  STAssertEqualObjects(@"cats and dogs", [@"cats and dogs" stringByReplacingFirstOccurrenceOfRegularExpression:@"...s" withString:@"cats" error:&error], @"Should not change anything");
  STAssertEqualObjects(@"ducks and ducks", [@"cats and dogs" stringByReplacingOccurrencesOfRegularExpression:@"...s" withString:@"ducks" error:&error], @"Should replace both cats and dogs with ducks");

  NSArray* expected = @[ @"boo", @"and:foo" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@":" withLimit:2 error:&error], @"Split with limit 2");

  expected = @[ @"boo", @"and", @"foo" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@":" withLimit:5 error:&error], @"Split with limit 5");

  expected = @[ @"boo", @"and", @"foo" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@":" withLimit:-2 error:&error], @"Split with limit -2");

  expected = @[ @"b", @"", @":and:f", @"", @"" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@"o" withLimit:5 error:&error], @"Split with limit 5");

  expected = @[ @"b", @"", @":and:f", @"", @"" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@"o" withLimit:-2 error:&error], @"Split with limit -2");

  expected = @[ @"b", @"", @":and:f" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@"o" withLimit:0 error:&error], @"Split with limit 0");

  expected = @[ @"b", @"", @":and:f" ];
  STAssertEqualObjects(expected, [@"boo:and:foo" componentsSeparatedByRegularExpression:@"o" error:&error], @"Split without limit");

  STAssertNil(error, @"All patterns should be valid");
}

- (void)testAppendMethods {
  NSError* error = NULL;

  RegexPattern* p = [RegexPattern compileRegularExpression:@"cat" error:&error];
  Matcher* m = [p matcherWithInput:@"one cat two cats in the yard"];

  NSMutableString* ms = [NSMutableString string];
  while ([m find]) {
    [m appendReplacement:@"dog" toString:ms];
  }
  [m appendTailToString:ms];

  STAssertEqualObjects(@"one dog two dogs in the yard", ms, @"There's no cats left");

  m.pattern = [RegexPattern compileRegularExpression:@"(.)(.)" error:&error];
  [m resetWithInput:@"ABCDEFGH"];

  ms = [NSMutableString string];
  while ([m find]) {
    [m appendReplacement:@"$2$1" toString:ms];
  }
  [m appendTailToString:ms];

  STAssertEqualObjects(@"BADCFEHG", ms, @"Reverse letters in pairs");

  STAssertNil(error, @"All patterns should be valid");
}

- (void)testReplaceMethods {
  NSError* error = NULL;

  RegexPattern* p = [RegexPattern compileRegularExpression:@"a*b" error:&error];
  Matcher* m = [p matcherWithInput:@"aabfooaabfooabfoob"];

  STAssertEqualObjects(@"-foo-foo-foo-", [m replaceAllWithReplacement:@"-"], @"Replace all occurrences");

  m.pattern = [RegexPattern compileRegularExpression:@"dog" error:&error];
  [m resetWithInput:@"zzzdogzzzdogzzz"];

  STAssertEqualObjects(@"zzzcatzzzdogzzz", [m replaceFirstWithReplacement:@"cat"], @"Replace first occurrence");

  STAssertNil(error, @"All patterns should be valid");
}

- (void)testQuote {
  NSError* error = NULL;

  NSString* regularExpression = @"([a-z]* )+$";

  RegexPattern* p = [RegexPattern compileRegularExpression:regularExpression error:&error];
  Matcher* m = [p matcherWithInput:@"one two three "];

  STAssertTrue([m matches], @"Should match");

  [m resetWithInput:regularExpression];

  STAssertFalse([m matches], @"Should not match");

  m.pattern = [RegexPattern compileRegularExpression:[RegexPattern quoteString:regularExpression] error:&error];
  [m resetWithInput:@"one two three "];

  STAssertFalse([m matches], @"Should not match");

  [m resetWithInput:regularExpression];

  STAssertTrue([m matches], @"Should match");

  STAssertEqualObjects(@"\\$1\\$2\\$3\\\\\\$\\$\\$\\\\\\\\\\$4\\$5\\$6", [Matcher quoteReplacement:@"$1$2$3\\$$$\\\\$4$5$6"], @"Escape nightmare");

  STAssertNil(error, @"All patterns should be valid");
}

@end
