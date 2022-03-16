import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/**    */
public class UseTaxComparatorTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }
   /**
    *
    */
   @Test public void compareTest1() {
      Vehicle car1 = new Car("Jones, Sam", "2017 Honda Accord",
                              22000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                              22000, false);
      UseTaxComparator tax = new UseTaxComparator();
      int result = tax.compare(car1, car2);
      Assert.assertEquals(0, result, 0.0001);
   }
   /**
    *
    */
   @Test public void compareTest2() {
      Vehicle car1 = new Car("Jones, Sam", "2017 Honda Accord",
                              21000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                              22000, false);
      UseTaxComparator tax = new UseTaxComparator();
      int result = tax.compare(car1, car2);
      Assert.assertEquals(-1, result, 0.0001);
   }
   /**
    *
    */
   @Test public void compareTest3() {
      Vehicle car1 = new Car("Jones, Sam", "2017 Honda Accord",
                              23000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                              22000, false);
      UseTaxComparator tax = new UseTaxComparator();
      int result = tax.compare(car1, car2);
      Assert.assertEquals(1, result, 0.0001);
   }

}
