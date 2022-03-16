/** Extends InventoryItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 10, 2017
 */
public class ElectronicsItem extends InventoryItem {
   protected double weight;
   /** Constant shipping cost. */
   public static final double SHIPPING_COST = 1.5;
/** Constructor Method.
 *@param nameIn -
 *@param priceIn -
 *@param weightIn -
 */
   public ElectronicsItem(String nameIn, double priceIn, double weightIn) {
      super(nameIn, priceIn);
   
      weight = weightIn;
   }
   /** Method to override calculateCost.
    *@return -
    */
   public double calculateCost() {
      return super.calculateCost() + (SHIPPING_COST * weight);
   }
}
