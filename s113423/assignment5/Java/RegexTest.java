import org.junit.*;
import static org.junit.Assert.*;

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
  }
}