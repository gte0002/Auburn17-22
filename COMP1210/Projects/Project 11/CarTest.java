import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Car Test methods. */
public class CarTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }
   /** Test useTax.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void useTaxTest1() throws NegativeValueException {
      Car car1 = new Car("Jones, Sam", "2017 Honda Accord", 22000, false);
      double output = 220.0;
      Assert.assertEquals("useTaxTest1", output, car1.useTax(), 0.0001);
   }
   /** Test useTax.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void useTaxTest2() throws NegativeValueException {
      Car car2 = new Car("Jones, Jo", "2017 Honda Accord", 22000, true);
      double output = 110.0;
      Assert.assertEquals("useTaxTest2", output, car2.useTax(), 0.0001);
   }
   /** Test useTax.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void useTaxTest3() throws NegativeValueException {
      Car car3 = new Car("Smith, Pat", "2015 Mercedes-Benz Coupe",
                     110000, false);
      double output = 3300.0;
      Assert.assertEquals("useTaxTest2", output, car3.useTax(), 0.0001);
   }
   /** Test useTax.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void useTaxTest4() throws NegativeValueException {
      Car car4 = new Car("Smith, Jack", "2015 Mercedes-Benz Coupe", 
                     110000, true);
      double output = 2750.0;
      Assert.assertEquals("useTaxTest2", output, car4.useTax(), 0.0001);
   }
   /** to String Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest1() throws NegativeValueException {
      Car car1 = new Car("Jones, Sam", "2017 Honda Accord", 
                     22000, false);
      String output = "Jones, Sam: Car 2017 Honda Accord" 
         +  "\nValue: $22,000.00 Use Tax: $220.00\nwith Tax Rate: 0.01";
      Assert.assertEquals("useTaxTest1", output, car1.toString());
   }
   /** to String Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest2() throws NegativeValueException {
      Car car2 = new Car("Jones, Jo", "2017 Honda Accord", 
                              22000, true);
      String output = "Jones, Jo: Car 2017 Honda Accord (Alternative Fuel)" 
         +  "\nValue: $22,000.00 Use Tax: $110.00\nwith Tax Rate: 0.005";
      Assert.assertEquals("useTaxTest2", output, car2.toString());
   }
   /** to String Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest3() throws NegativeValueException {
      Car car3 = new Car("Smith, Pat", "2015 Mercedes-Benz Coupe",
                              110000, false);
      String output = "Smith, Pat: Car 2015 Mercedes-Benz Coupe" 
         +  "\nValue: $110,000.00 Use Tax: $3,300.00"
         +  "\nwith Tax Rate: 0.01 Luxury Tax Rate: 0.02";
      Assert.assertEquals("useTaxTest2", output, car3.toString());
   }
   /** to String Test.
    *@throws NegativeValueException if value is less than 0.
    */
   @Test public void toStringTest4() throws NegativeValueException {
      Car car4 = new Car("Smith, Jack", "2015 Mercedes-Benz Coupe", 
                              110000, true);
      String output = "Smith, Jack: Car 2015 Mercedes-Benz Coupe" 
         +  " (Alternative Fuel)\nValue: $110,000.00 Use Tax: $2,750.00"
         +  "\nwith Tax Rate: 0.005 Luxury Tax Rate: 0.02";
      Assert.assertEquals("useTaxTest2", output, car4.toString());
   }
}
