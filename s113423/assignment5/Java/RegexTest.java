import org.junit.*;
import static org.junit.Assert.*;

import java.util.*;
import java.util.regex.*;

public class RegexTest {
  @Test(expected=PatternSyntaxException.class)
  public void testInvalidPattern() {
    Pattern p = Pattern.compile("a*b)"); // mismatched parenthesis
  }

  @Test
  public void testPatternAndMatches() {
    Pattern p = Pattern.compile("a*b");

    Matcher m = p.matcher("aaaab");
    assertTrue(m.matches()); // should match

    m = p.matcher("aacab");
    assertFalse(m.matches()); // should not match
  }

  @Test
  public void testMatchesWithRegion() {
    Pattern p = Pattern.compile("cats?");

    Matcher m = p.matcher("cats and dogs");
    assertFalse(m.matches()); // must match whole region
    assertEquals(0, m.regionStart());
    assertEquals(13, m.regionEnd());

    m.region(0, 2);
    assertFalse(m.matches()); // should not match: region = "ca"
    assertEquals(0, m.regionStart());
    assertEquals(2, m.regionEnd());

    m.region(0, 3);
    assertTrue(m.matches()); // should not match: region = "cat"
    assertEquals(0, m.regionStart());
    assertEquals(3, m.regionEnd());

    m.region(0, 4);
    assertTrue(m.matches()); // should match: region = "cats"
    assertEquals(0, m.regionStart());
    assertEquals(4, m.regionEnd());

    m.region(1, 4);
    assertFalse(m.matches()); // should not match: region = "ats"
    assertEquals(1, m.regionStart());
    assertEquals(4, m.regionEnd());
  }

  @Test
  public void testGroups() {
    Pattern p = Pattern.compile("@interface ([A-Z][A-Za-z]+) : ([A-Z][A-Za-z]+)(?: <([A-Z][A-Za-z]+)>)?");

    Matcher m = p.matcher("@interface Matcher <MatchResult>");
    assertFalse(m.matches()); // should not match
    assertEquals(3, m.groupCount());

    try {
      m.group();
      fail("Should throw: No match made");
    } catch (IllegalStateException e) {
    }

    m.reset("@interface Matcher : NSObject");
    assertTrue(m.matches()); // should match
    assertEquals(3, m.groupCount());
    assertEquals("@interface Matcher : NSObject", m.group());
    assertEquals("@interface Matcher : NSObject", m.group(0));
    assertEquals("Matcher", m.group(1));
    assertEquals("NSObject", m.group(2));
    assertEquals(null, m.group(3));

    m.reset("@interface Matcher : NSObject <MatchResult>");
    assertTrue(m.matches()); // should match
    assertEquals(3, m.groupCount());
    assertEquals("@interface Matcher : NSObject <MatchResult>", m.group());
    assertEquals("@interface Matcher : NSObject <MatchResult>", m.group(0));
    assertEquals("Matcher", m.group(1));
    assertEquals("NSObject", m.group(2));
    assertEquals("MatchResult", m.group(3));

    try {
      m.group(4);
      fail("Should throw: No such group");
    } catch (IndexOutOfBoundsException e) {
    }
  }

  @Test
  public void testReset() {
    Pattern p = Pattern.compile("two");

    Matcher m = p.matcher("one two three");
    assertFalse(m.matches());

    m.region(4, 7);
    assertTrue(m.matches());

    m.reset();
    assertFalse(m.matches());
  }

  @Test
  public void testChangeOfPattern() {
    Pattern p = Pattern.compile("(.+) (.+) (.+)");

    Matcher m = p.matcher("one two three");
    assertTrue(m.matches());
    assertEquals(3, m.groupCount());
    assertEquals("one", m.group(1));
    assertEquals("two", m.group(2));
    assertEquals("three", m.group(3));

    m.usePattern(Pattern.compile("one t(.+) (.+)"));
    assertTrue(m.matches());
    assertEquals(2, m.groupCount());
    assertEquals("wo", m.group(1));
    assertEquals("three", m.group(2));

    m.usePattern(Pattern.compile("one three (.+)"));
    assertFalse(m.matches());
    assertEquals(1, m.groupCount());

    p = Pattern.compile("(.) (..) (...)");
    m = p.matcher("A BB CCC");

    try {
      m.group(2);
      fail("No match found yet, should throw");
    } catch (IllegalStateException e) {
    }

    assertTrue(m.matches());
    assertEquals(3, m.groupCount());
    assertEquals("A BB CCC", m.group(0));
    assertEquals("A", m.group(1));
    assertEquals("BB", m.group(2));
    assertEquals("CCC", m.group(3));

    m.usePattern(Pattern.compile(". (.). .(..)"));

    assertEquals(2, m.groupCount());

    // these do not throw, instead they return null
    assertNull(m.group());
    assertNull(m.group(0));
    assertNull(m.group(1));
    assertNull(m.group(2));

    // without group index they return what it did before
    assertEquals(0, m.start());
    assertEquals(8, m.end());

    // with group index they return -1
    assertEquals(-1, m.start(0));
    assertEquals(-1, m.end(0));
    assertEquals(-1, m.start(1));
    assertEquals(-1, m.end(1));
    assertEquals(-1, m.start(2));
    assertEquals(-1, m.end(2));

    try {
      m.group(3);
      fail("Pattern updated with one less group");
    } catch (IndexOutOfBoundsException e) {
    }

    assertTrue(m.matches());
    assertEquals(2, m.groupCount());
    assertEquals("A BB CCC", m.group(0));
    assertEquals("B", m.group(1));
    assertEquals("CC", m.group(2));

    try {
      m.usePattern(null);
      fail("Passing null should throw");
    } catch (IllegalArgumentException e) {
    }
  }

  @Test
  public void testFind() {
    Pattern p = Pattern.compile("\\b\\w{3}\\b");
    Matcher m = p.matcher("The quick brown fox jumps over the lazy dog");

    List<String> threeLetterWords = new ArrayList<String>();
    List<Integer> starts = new ArrayList<Integer>();
    List<Integer> ends = new ArrayList<Integer>();
    while (m.find()) {
      threeLetterWords.add(m.group());
      starts.add(m.start());
      ends.add(m.end());
    }

    List<String> expectedWords = new ArrayList<String>(Arrays.asList("The", "fox", "the", "dog"));
    assertTrue(expectedWords.equals(threeLetterWords));

    List<Integer> expectedStarts = new ArrayList<Integer>(Arrays.asList(0, 16, 31, 40));
    assertTrue(expectedStarts.equals(starts));

    List<Integer> expectedEnds = new ArrayList<Integer>(Arrays.asList(3, 19, 34, 43));
    assertTrue(expectedEnds.equals(ends));
  }

  @Test
  public void testPositionState() {
    Pattern p = Pattern.compile(".+?");
    Matcher m = p.matcher("Hello World");

    assertTrue(m.find());
    assertEquals("H", m.group());
    assertTrue(m.find());
    assertEquals("e", m.group());
    assertTrue(m.matches());
    assertEquals("Hello World", m.group());
    assertFalse(m.find()); // end reached nothing to find

    try {
      m.group();
      fail("m.find() returned false, calling m.group() should throw");
    } catch (IllegalStateException e) {
    }

    m.reset("aaaaba");

    assertTrue(m.find());
    assertEquals("a", m.group());
    assertEquals(0, m.start());
    assertEquals(1, m.end());

    m.usePattern(Pattern.compile("a+?")); // change pattern

    assertFalse(m.matches());

    try {
      m.group();
      fail("m.matches() returned false, calling m.group() should throw");
    } catch (IllegalStateException e) {
    }

    try {
      m.end();
      fail("m.matches() returned false, calling m.end() should throw");
    } catch (IllegalStateException e) {
    }

    assertFalse(m.hitEnd()); // end not reached yet

    assertTrue(m.find()); // find the last a
    assertEquals("a", m.group());
    assertEquals(5, m.start());
    assertEquals(6, m.end());

    assertFalse(m.hitEnd()); // end not still not reached

    assertFalse(m.find());

    assertTrue(m.hitEnd()); // end finally reached
  }

  @Test
  public void testStringMethods() {
    assertTrue("something".matches("[a-z]+thing"));
    assertFalse("anythang".matches("[a-z]+thing"));

    assertEquals("dogs and dogs", "cats and dogs".replaceFirst("...s", "dogs"));
    assertEquals("cats and cats", "cats and cats".replaceFirst("...s", "cats"));
    assertEquals("ducks and ducks", "cats and dogs".replaceAll("...s", "ducks"));

    assertArrayEquals(new String[] {"boo", "and:foo"}, "boo:and:foo".split(":", 2));
    assertArrayEquals(new String[] {"boo", "and", "foo"}, "boo:and:foo".split(":", 5));
    assertArrayEquals(new String[] {"boo", "and", "foo"}, "boo:and:foo".split(":", -2));
    assertArrayEquals(new String[] {"b", "", ":and:f", "", ""}, "boo:and:foo".split("o", 5));
    assertArrayEquals(new String[] {"b", "", ":and:f", "", ""}, "boo:and:foo".split("o", -2));
    assertArrayEquals(new String[] {"b", "", ":and:f"}, "boo:and:foo".split("o", 0));
    assertArrayEquals(new String[] {"b", "", ":and:f"}, "boo:and:foo".split("o"));
  }

  @Test
  public void testAppendMethods() {
    Pattern p = Pattern.compile("cat");
    Matcher m = p.matcher("one cat two cats in the yard");

    StringBuffer sb = new StringBuffer();
    while (m.find()) {
      m.appendReplacement(sb, "dog");
    }
    m.appendTail(sb);
    assertEquals("one dog two dogs in the yard", sb.toString());

    m.usePattern(Pattern.compile("(.)(.)"));
    m.reset("ABCDEFGH");
    sb = new StringBuffer();
    while (m.find()) {
      m.appendReplacement(sb, "$2$1");
    }
    m.appendTail(sb);
    assertEquals("BADCFEHG", sb.toString());
  }

  @Test
  public void testReplaceAllAndFirst() {
    Pattern p = Pattern.compile("a*b");
    Matcher m = p.matcher("aabfooaabfooabfoob");

    assertEquals("-foo-foo-foo-", m.replaceAll("-"));

    m.usePattern(Pattern.compile("dog"));
    m.reset("zzzdogzzzdogzzz");

    assertEquals("zzzcatzzzdogzzz", m.replaceFirst("cat"));
  }

  @Test
  public void testQuote() {
    String regularExpression = "^([a-z]* )+$";

    Pattern p = Pattern.compile(regularExpression);
    Matcher m = p.matcher("one two three ");

    assertTrue(m.matches());

    m.reset(regularExpression);

    assertFalse(m.matches());

    m.usePattern(Pattern.compile(Pattern.quote(regularExpression)));
    m.reset("one two three ");

    assertFalse(m.matches());

    m.reset(regularExpression);

    assertTrue(m.matches());

    assertEquals("\\$1\\$2\\$3\\\\\\$\\$\\$\\\\\\\\\\$4\\$5\\$6", m.quoteReplacement("$1$2$3\\$$$\\\\$4$5$6"));
  }
}