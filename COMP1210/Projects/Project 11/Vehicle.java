import java.text.DecimalFormat;
/** Main method for Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 14, 2017
 */
public abstract class Vehicle implements Comparable<Vehicle> {
   protected String owner;
   protected String yearMakeModel;
   protected double value;
   protected boolean altFuel;
   private static int vehicleCount;
   /** Constructor.
    *@param ownerIn -
    *@param yearMakeModelIn -
    *@param valueIn -
    *@param altFuelIn -
    *@throws NegativeValueException if file cannot open.
    */
   public Vehicle(String ownerIn, String yearMakeModelIn, 
                  double valueIn, boolean altFuelIn) 
                  throws NegativeValueException {
      vehicleCount++;
      owner = ownerIn;
      yearMakeModel = yearMakeModelIn;
      value = valueIn;
      altFuel = altFuelIn;
      if (value < 0) {
         throw new NegativeValueException();
      }
   }
   /** Method to get Owner.
    *@return -owner
    */
   public String getOwner() {
      return owner;
   }
    /** Method to setOwner.
     *@param ownerIn -
     */
   public void setOwner(String ownerIn) {
      owner = ownerIn;
   }
     /** method to getYearMakeModel.
      *@return -yearMakeModel
      */
   public String getYearMakeModel() {
      return yearMakeModel;
   }
      /** Method to setYearMakeModel.
       *@param yearMakeModelIn -
       */
   public void setYearMakeModel(String yearMakeModelIn) {
      yearMakeModel = yearMakeModelIn;
   }
      /** Method to get Value.
       *@return -value
       */
   public double getValue() {
      return value;
   }
      /** Method to setValue.
       *@param valueIn -
       */
   public void setValue(double valueIn) {
      value = valueIn;
   }
      /** Method to getAlternativeFuel.
       *@return -altFuel
       */
   public boolean getAlternativeFuel() {
      return altFuel;
   }
      /** Method to setAlternativeFuel.
       *@param altFuelIn -
       */
   public void setAlternativeFuel(boolean altFuelIn) {
      altFuel = altFuelIn;
   }
      /** Method to get VehicleCount.
       *@return vehicleCount -
       */
   public static int getVehicleCount() {
      return vehicleCount;
   }
      /** Method to reset Vehicle Count.
       *
       */
   public static void resetVehicleCount() {
      vehicleCount = 0; 
   }
      /** Abstract method useTax.
       *@return -
       */
   public abstract double useTax(); 
      /** to String method.
       *@return -output
       */
   public String toString() {
      DecimalFormat fmt = new DecimalFormat("'$'#,##0.00");
      String output =  "";
      if (altFuel)
      {
         output = getOwner() + ": " + this.getClass().getName()
            + " " + getYearMakeModel() + " (Alternative Fuel)"  + "\nValue: " 
            + fmt.format(getValue()) + " Use Tax: " + fmt.format(useTax());
      
      }
      else
      {
         output = getOwner() + ": " + this.getClass().getName()
            + " " + getYearMakeModel() + "\nValue: " + fmt.format(getValue()) 
            + " Use Tax: " + fmt.format(useTax());
      
      }
      
      
      return output;
   }
   /** Compareto method.
    *@param example -
    *@return -
    */
   public int compareTo(Vehicle example) {
      return owner.toLowerCase()  
                 .compareTo(example.getOwner().toLowerCase());
   }
   /**
       * @param obj the other object 
       * @return boolean
       */
   public boolean equals(Object obj) {
       
      if (!(obj instanceof Vehicle)) {
         return false;
      }
      else {
         Vehicle other = (Vehicle) obj;
         return (owner + yearMakeModel + value).
               equals(other.owner + other.yearMakeModel + other.value);
      }
   }
      /** Hash code method.
       *@return -
       */
   public int hashCode() {
      return 0;
   }
       
}