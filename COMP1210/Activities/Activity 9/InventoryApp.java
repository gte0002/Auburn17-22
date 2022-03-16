/** Main driver for InventoryItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 13, 2017
 */
public class InventoryApp {
  /** Main Method.
   *@param args -
   */
   public static void main(String[] args) {
      InventoryItem item1 = new InventoryItem("Oil change kit", 39.00);
      
      ElectronicsItem item2 = new ElectronicsItem("Cordless phone", 80.00, 1.8);
   
      OnlineArticle item3 = new OnlineArticle("Java News", 8.50);
      item3.setWordCount(700);
      
      OnlineBook item4 = new OnlineBook("Java for Noobs", 13.37);
      item4.setAuthor("L. G. Jones");
      
      System.out.println(item1 + "\n\n" + item2 + "\n\n" + item3
         + "\n\n" + item4);
   }

}   
