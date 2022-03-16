import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/** Test method for main.
 */
public class VehiclesPart1Test {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }


   /** Main Driver test method.
   */
   @Test public void toStringTest() {
      VehiclesPart1 vp1 = new VehiclesPart1();
      Vehicle.resetVehicleCount();
      VehiclesPart1.main(null);
      Assert.assertEquals("Vehicle.vehicleCount should be 4. ",
                              4, Vehicle.getVehicleCount());
   }
}
