 /** Extends Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 14, 2017
 */
public class Motorcycle extends Vehicle {
   protected double engSize;
   /** Constant rate. */
   public static final double TAX_RATE = 0.005;
   /** Constant rate. */
   public static final double ALTERNATIVE_FUEL_TAX_RATE = 0.0025;
   /** Constant rate. */
   public static final double LARGE_BIKE_CC_THRESHOLD = 499;
   /** Constant rate. */
   public static final double LARGE_BIKE_TAX_RATE = 0.015;
   /** Constructor.
    *@param ownerIn -
    *@param yearMakeModelIn -
    *@param valueIn -
    *@param altFuelIn -
    *@param engSizeIn -
    */
   public Motorcycle(String ownerIn, String yearMakeModelIn, 
         double valueIn, boolean altFuelIn, double engSizeIn) {
      super(ownerIn, yearMakeModelIn, valueIn, altFuelIn);
      engSize = engSizeIn;
   }
   /** MEthod to get engine size.
    *@return -engine size
    */
   public double getEngineSize() {
      return engSize;
   }
   /** set engine size.
    *@param engSizeIn -
    */
   public void setEngineSize(double engSizeIn) {
      engSize = engSizeIn;
   }
   /** Override useTax.
    *@return -output
    */
   public double useTax() {
      double output;
      if (altFuel) {
         output = value * ALTERNATIVE_FUEL_TAX_RATE;
      }
      else {
         output = value * TAX_RATE;
      }
      if (engSize > LARGE_BIKE_CC_THRESHOLD) {
         output += value * LARGE_BIKE_TAX_RATE;
      }
      return output;
   }
   /** toString method.
    *@return -output
    */
   public String toString() {
      String output = super.toString() + "\nwith Tax Rate: "; 
      
      if (altFuel) {
         output += ALTERNATIVE_FUEL_TAX_RATE;
      }
      else {
         output += TAX_RATE;
      }
      if (engSize > LARGE_BIKE_CC_THRESHOLD) {
         output += " Large Bike Tax Rate: " +  LARGE_BIKE_TAX_RATE;
      }
   
      return output;
   }
}

