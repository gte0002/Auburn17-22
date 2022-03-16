import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import java.io.FileNotFoundException;


public class VehiclesPart3Test {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }


   /**   **/
   @Test public void mainTest() throws FileNotFoundException {
      VehiclesPart3 vPart2Obj = new VehiclesPart3();
   
      Vehicle.resetVehicleCount();
   
      String[] args = {"vehicles2.txt"};
      VehiclesPart3.main(args);
      Assert.assertEquals(13, Vehicle.getVehicleCount());
   }

}
