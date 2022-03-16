 /** Extends Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 14, 2017
 */
public class Truck extends Vehicle {
   protected double tons;
   /** Constant rate. */
   public static final double TAX_RATE = 0.02;
   /** Constant rate. */
   public static final double ALTERNATIVE_FUEL_TAX_RATE = 0.01;
   /** Constant rate. */
   public static final double LARGE_TRUCK_TONS_THRESHOLD = 2.0;
   /** Constant rate. */
   public static final double LARGE_TRUCK_TAX_RATE = 0.03;
   /** Constructor.
    *@param ownerIn -
    *@param yearMakeModelIn -
    *@param valueIn -
    *@param altFuelIn -
    *@param tonsIn -
    */
   public Truck(String ownerIn, String yearMakeModelIn, 
                           double valueIn, boolean altFuelIn, double tonsIn) {
      super(ownerIn, yearMakeModelIn, valueIn, altFuelIn);
      tons = tonsIn;
   }
   /** getTons method.
    *@return -
    */
   public double getTons() {
      return tons;
   }
   /** setTons Method.
    *@param tonsIn -
    */
   public void setTons(double tonsIn) {
      tons = tonsIn;
   }
   /** Override useTax.
    *@return -
    */
   public double useTax() {
      double output;
      if (altFuel) {
         output = value * ALTERNATIVE_FUEL_TAX_RATE;
      }
      else {
         output = value * TAX_RATE;
      }
      if (tons > LARGE_TRUCK_TONS_THRESHOLD) {
         output += value * LARGE_TRUCK_TAX_RATE;
      }
      return output;
   }
   /** to String method.
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
      if (tons > LARGE_TRUCK_TONS_THRESHOLD) {
         output += " Large Truck Tax Rate: " +  LARGE_TRUCK_TAX_RATE;
      }
   
      return output;
   }

}