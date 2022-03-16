import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Methods for truck. */
public class TruckTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }
   /** getTons test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void getTonsTest() throws NegativeValueException {
      Truck truck1 = new Truck("Williams, Jo", "2012 Chevy Silverado", 
         30000, false, 1.5);
      Assert.assertEquals("getTonsTest", 1.5, truck1.getTons(), 0.0001);
   }
   /** useTax Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void useTaxTest1() throws NegativeValueException {
      Truck truck1 = new Truck("Williams, Jo", "2012 Chevy Silverado", 
         30000, false, 1.5);
      double output = 600;
      Assert.assertEquals("useTaxTest1", output, truck1.useTax(), 0.0001);
   }
   /** useTax Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void useTaxTest2() throws NegativeValueException {
      Truck truck2 = new Truck("Williams, Sam", "2010 Chevy Mack", 
            40000, true, 2.5);
      double output = 1600;
      Assert.assertEquals("useTaxTest2", output, truck2.useTax(), 0.0001);
   }
   /** toString Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest1() throws NegativeValueException {
      Truck truck1 = new Truck("Williams, Jo", "2012 Chevy Silverado", 
         30000, false, 1.5);
      String output = "Williams, Jo: Truck 2012 Chevy Silverado" 
         +  "\nValue: $30,000.00 Use Tax: $600.00"
         +  "\nwith Tax Rate: 0.02";
      Assert.assertEquals("toStringTest1", output, truck1.toString());
   }
   /** toString Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest2() throws NegativeValueException {
      Truck truck = new Truck("Williams, Sam", "2010 Chevy Mack", 
                              40000, true, 1.5);
      String output = "Williams, Sam: Truck 2010 Chevy Mack (Alternative Fuel)"
                        +  "\nValue: $40,000.00 Use Tax: $400.00"
                        +  "\nwith Tax Rate: 0.01";
      Assert.assertEquals("toStringTest2", output, truck.toString());
   }
   /** toString Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest3() throws NegativeValueException {
      Truck truck1 = new Truck("Williams, Jo", "2012 Chevy Silverado", 
         30000, false, 2.5);
      String output = "Williams, Jo: Truck 2012 Chevy Silverado"
                        +  "\nValue: $30,000.00 Use Tax: $1,500.00"
                        +  "\nwith Tax Rate: 0.02 Large Truck Tax Rate: 0.03";
      Assert.assertEquals("toStringTest3", output, truck1.toString());
   }
   /** toString Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest4() throws NegativeValueException {
      Truck truck2 = new Truck("Williams, Sam", "2010 Chevy Mack", 
                              40000, true, 2.5);
      String output = "Williams, Sam: Truck 2010 Chevy Mack (Alternative Fuel)" 
         +  "\nValue: $40,000.00 Use Tax: $1,600.00"
         +  "\nwith Tax Rate: 0.01 Large Truck Tax Rate: 0.03";
      Assert.assertEquals("toStringTest4", output, truck2.toString());
   }
}
