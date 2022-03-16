import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Tractor Trailer test methods. */
public class SemiTractorTrailerTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }
   /** getAxles test.
    *
    */
   @Test public void getAxlesTest() {
      SemiTractorTrailer semi1 = new SemiTractorTrailer("Williams, Pat", 
         "2012 International Big Boy", 45000, false, 5.0, 4);
      Assert.assertEquals("getAxlesTest", 4, semi1.getAxles());
   }
   /** useTax Test.
    *
    */
   @Test public void useTaxTest() {
      SemiTractorTrailer semi1 = new SemiTractorTrailer("Williams, Pat", 
         "2012 International Big Boy", 45000, false, 5.0, 4);
      Assert.assertEquals("useTaxTest", 3150.0, semi1.useTax(), 0.0001);
   }
   /** toString test.
    *
    */
   @Test public void toStringTest() {
      SemiTractorTrailer semi1 = new SemiTractorTrailer("Williams, Pat", 
         "2012 International Big Boy", 45000, false, 5.0, 4);
      String output;
      output = "Williams, Pat: SemiTractorTrailer 2012 International Big Boy"
         + "\nValue: $45,000.00 Use Tax: $3,150.00"
         + "\nwith Tax Rate: 0.02 Large Truck Tax Rate: " 
         + "0.03 Axle Tax Rate: 0.02";
      Assert.assertEquals("toStringTest", output, semi1.toString());
   }
}
