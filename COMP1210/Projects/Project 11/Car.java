/** Extends Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 14, 2017
 */
public class Car extends Vehicle {
   /** Constant rate. */
   public static final double TAX_RATE = 0.01;
   /** Constant rate. */
   public static final double ALTERNATIVE_FUEL_TAX_RATE = 0.005;
   /** Constant rate. */
   public static final double LUXURY_THRESHOLD = 50000;
   /** Constant rate. */
   public static final double LUXURY_TAX_RATE = 0.02;
   /** Constructor.
    *@param ownerIn -
    *@param yearMakeModelIn -
    *@param valueIn -
    *@param altFuelIn -
    *@throws NegativeValueException if file cannot open. 
    */
   public Car(String ownerIn, String yearMakeModelIn, 
                                    double valueIn, boolean altFuelIn)
                                    throws NegativeValueException {
      super(ownerIn, yearMakeModelIn, valueIn, altFuelIn);
      if (value < 0) {
         throw new NegativeValueException();
      }
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
      if (value > LUXURY_THRESHOLD) {
         output += value * LUXURY_TAX_RATE;
      }
      return output;
   }
   /** to String method.
    *@return -
    */
   public String toString() {
      String output = super.toString() + "\nwith Tax Rate: "; 
      
      if (altFuel) {
         output += ALTERNATIVE_FUEL_TAX_RATE;
      }
      else {
         output += TAX_RATE;
      }
      if (value > LUXURY_THRESHOLD) {
         output += " Luxury Tax Rate: " +  LUXURY_TAX_RATE;
      }
   
      return output;
   }
   


}