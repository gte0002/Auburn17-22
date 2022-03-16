import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;


public class SelectorTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }



   @Test
   public void testKMin() {
      int[] a = new int[]{5, 7};
      int k = 2;
      int expected = 7;
      int actual = Selector.kmin(a, k);
      Assert.assertEquals(expected, actual);
   }
}
