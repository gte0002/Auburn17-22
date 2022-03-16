 /** Extends Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 14, 2017
 */
public class SemiTractorTrailer extends Truck {
   protected int axles;
   /** Constant rate. */
   public static final double PER_AXLE_TAX_RATE = 0.005;
   /** Constructor.
    *@param ownerIn -
    *@param yearMakeModelIn -
    *@param valueIn -
    *@param altFuelIn -
    *@param axlesIn -
    *@param tonsIn -
    *@throws NegativeValueException if file cannot open.
    */
   public SemiTractorTrailer(String ownerIn, String yearMakeModelIn, 
         double valueIn, boolean altFuelIn, double tonsIn, int axlesIn)
         throws NegativeValueException {
      super(ownerIn, yearMakeModelIn, valueIn, altFuelIn, tonsIn);
      axles = axlesIn;
      if (axles < 0) {
         throw new NegativeValueException();
      }
   }
   /** Method for getAxles.
    *@return -axles
    */
   public int getAxles() {
      return axles;
   }
   /** Method for setAxles.
    *@param axlesIn -
    */
   public void setAxles(int axlesIn) {
      axles = axlesIn;
   }
   /** Override useTax.
    *@return -total
    */
   public double useTax() {
      double total = super.useTax() + value * PER_AXLE_TAX_RATE * axles;
      return total;
   }
   /** to String Method.
    *@return -output
    */
   public String toString() {
      String output = super.toString() + " Axle Tax Rate: " 
         + PER_AXLE_TAX_RATE * axles;
      return output;
   }
}