import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import java.io.FileNotFoundException;

/**   */
public class VehiclesPart2Test {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }


   /** Main driver Test.
    * @throws FileNotFoundException if file cannot open.
    */
   @Test public void mainTest() throws FileNotFoundException {
      VehiclesPart2 vPart2Obj = new VehiclesPart2();
   
      Vehicle.resetVehicleCount();
   
      String[] args = {"vehicles1.txt"};
      VehiclesPart2.main(args);
      Assert.assertEquals(8, Vehicle.getVehicleCount());
   }
}
