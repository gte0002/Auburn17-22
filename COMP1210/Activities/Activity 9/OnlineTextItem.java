/** Extends InventoryItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 10, 2017
 */
public abstract class OnlineTextItem extends InventoryItem {
/** Constructor Method.
 *@param nameIn -
 *@param priceIn -
 */
   public OnlineTextItem(String nameIn, double priceIn) {
      super(nameIn, priceIn);
   
   }
/** Method to override calCost.
 *@return -
 */
   public double calculateCost() {
      return price;
   
   }

}

