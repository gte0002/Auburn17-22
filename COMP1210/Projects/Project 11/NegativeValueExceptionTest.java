import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Test methods for exception.
 *
 */
public class NegativeValueExceptionTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }


   /**   **/
   @Test public void negativeValueExceptionTest() {
      boolean thrown = false;
      try {
         Car car = new Car("Jackson, Bo", "2012 Toyota Camry", -25000, false);
      }
      catch (NegativeValueException e) {
         thrown = true;
      }
      Assert.assertTrue("Expected NegativeValueException to be thrown.",
                              thrown);
   }
}
