import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
  @Test 
	public void testFilter() {
    List<String> result1 = Arrays.asList("yes","no","no","moon");
    IsMoon check = new IsMoon();
    List<String> answer = Arrays.asList("moon");
    assertEquals(answer, ListExamples.filter(result1, check));
    }

  @Test 
	public void testMerge() {
    List<String> result1 = Arrays.asList("a","b","bc","bd","c");
    List<String> result2 = Arrays.asList("ba","bb");
    List<String> answer = Arrays.asList("a","b","ba","bb","bc","bd","c");
    assertEquals(answer, ListExamples.merge(result1, result2));
    }
}
