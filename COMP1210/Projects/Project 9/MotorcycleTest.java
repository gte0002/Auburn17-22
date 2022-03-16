import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Test methods for motorcycle.
*/
public class MotorcycleTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }


  /** get engine size test.
   *
   */
   @Test public void getEngineSizeTest() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, false, 750);
      Assert.assertEquals("getEngineSizeTest", 750, 
                           bike1.getEngineSize(), 0.0001);
   }
   /** useTax test 1.
    *
    */
   @Test public void useTaxTest1() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, false, 750);
      double output = 280;
      Assert.assertEquals("useTaxTest1", output, bike1.useTax(), 0.0001);
   }
   /** useTax test 2.
    *
    */
   @Test public void useTaxTest2() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, true, 750);
      double output = 245;
      Assert.assertEquals("useTaxTest2", output, bike1.useTax(), 0.0001);
   }
   /** toString test 1.
    *
    */
   @Test public void toStringTest1() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, false, 750);
      String output;
      output = "Brando, Marlon: Motorcycle 1964 Harley-Davidson Sportster"
                     + "\nValue: $14,000.00 Use Tax: $280.00"
                     + "\nwith Tax Rate: 0.005 Large Bike Tax Rate: 0.015";
      Assert.assertEquals("toStringTest1", output, bike1.toString());
   }
   /** toString test 2.
    *
    */
   @Test public void toStringTest2() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, true, 750);
      String output;
      output = "Brando, Marlon: Motorcycle 1964 Harley-Davidson Sportster"
                     + " (Alternative Fuel)\nValue: $14,000.00 Use Tax: $245.00"
                     + "\nwith Tax Rate: 0.0025 Large Bike Tax Rate: 0.015";
      Assert.assertEquals("toStringTest2", output, bike1.toString());
   }
   /** toString test 3.
    *
    */
   @Test public void toStringTest3() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, false, 450);
      String output;
      output = "Brando, Marlon: Motorcycle 1964 Harley-Davidson Sportster"
                     + "\nValue: $14,000.00 Use Tax: $70.00"
                     + "\nwith Tax Rate: 0.005";
      Assert.assertEquals("toStringTest3", output, bike1.toString());
   }
   /** toString test 4.
    *
    */
   @Test public void toStringTest4() {
      Motorcycle bike1 = new Motorcycle("Brando, Marlon",
         "1964 Harley-Davidson Sportster", 14000, true, 450);
      String output;
      output = "Brando, Marlon: Motorcycle 1964 Harley-Davidson Sportster"
                     + " (Alternative Fuel)\nValue: $14,000.00 Use Tax: $35.00"
                     + "\nwith Tax Rate: 0.0025";
      Assert.assertEquals("toStringTest4", output, bike1.toString());
   }
}


