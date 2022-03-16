import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;


public class MinOfThreeTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }

   @Test public void min1() {
      int expected = 3;
      int actual = MinOfThree.min1(3, 3, 3);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min1_2() {
      int expected = 2;
      int actual = MinOfThree.min1(2, 2, 4);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min1_3() {
      int expected = 2;
      int actual = MinOfThree.min1(2, 4, 6);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min1_4() {
      int expected = 2;
      int actual = MinOfThree.min1(2, 6, 4);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min2() {
      int expected = 3;
      int actual = MinOfThree.min2(3, 3, 3);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min2_2() {
      int expected = 2;
      int actual = MinOfThree.min2(2, 2, 4);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min2_3() {
      int expected = 2;
      int actual = MinOfThree.min2(2, 4, 6);
      Assert.assertEquals(expected, actual);
   }
   @Test public void min2_4() {
      int expected = 2;
      int actual = MinOfThree.min2(2, 6, 4);
      Assert.assertEquals(expected, actual);
   }


}
