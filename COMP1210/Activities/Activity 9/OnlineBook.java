/** Extends OnlineTextItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 10, 2017
 */
public class OnlineBook extends OnlineTextItem {
   protected String author;
/** Constructor method.
  *@param nameIn -
  *@param priceIn -
  */  
   public OnlineBook(String nameIn, double priceIn) {
      super(nameIn, priceIn);
      
      author = "Author Not Listed";
   }
  /** override toString method.
   *@return -output
   */
   public String toString() {
      String output = name + " - " + author 
         + ": $" + calculateCost();
      return output;
   }
   /** setAuthor method.
    *@param authorIn -
    */
   public void setAuthor(String authorIn) {
      author = authorIn;
   }
}


