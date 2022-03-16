/** Extends InventoryItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 27, 2017
 */
public class ItemsList {
   private InventoryItem[] inventory;
   private int count;
  /** Constructor.
   *
   */
   public ItemsList() {
      inventory = new InventoryItem[20];
      count = 0;
   }
  /** Method to addItems.
   *@param itemIn -
   */
   public void addItem(InventoryItem itemIn) {
      inventory[count] = itemIn;
      count++;
   }
  /** Method to calculate Total.
   *@param electronicsSurcharge -
   *@return -
   */
   public double calculateTotal(double electronicsSurcharge) {
      double total = 0;
      for (int i = 0; i < count; i++) {
         if (inventory[i] instanceof ElectronicsItem) {
            total += inventory[i].calculateCost() + electronicsSurcharge;
         }
         else {
            total += inventory[i].calculateCost();
         }
      }
      return total;
   }
  /** ToString Method.
   *@return -output
   */
   public String toString() {
      String output = "All inventory:\n\n";
      
      for (int i = 0; i < count; i++) {
         output += inventory[i] + "\n";
      }
      return output;
   }
}