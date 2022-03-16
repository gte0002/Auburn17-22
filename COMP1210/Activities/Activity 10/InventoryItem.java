/** Methods for InventoryItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 10, 2017
 */
public class InventoryItem {
   protected String name;
   protected double price;
   private static double taxRate = 0;
   /** Constructor method.
    *@param nameIn -
    *@param priceIn -
    */   
   public InventoryItem(String nameIn, double priceIn) {
      name = nameIn;
      price = priceIn;
   }
   /** Method that gets Name.
    *@return -name
    */
   public String getName() {
      return name;
   }
   /** Method to calculate the cost.
    *@return -output
    */
   public double calculateCost() {
      double output = price * (1 + taxRate);
      return output;
   }
   /** Method to set the tax rate.
    *@param taxRateIn -
    */
   public static void setTaxRate(double taxRateIn) {
      taxRate = taxRateIn;
   }
   /** to String method.
    *@return -output
    */
   public String toString() {
      String output = name + ": $" + calculateCost();
      return output;
   }
}