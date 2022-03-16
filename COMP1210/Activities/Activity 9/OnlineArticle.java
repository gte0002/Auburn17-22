/** Extends OnlineTextItem.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 10, 2017
 */
public class OnlineArticle extends OnlineTextItem {
   private int wordCount;
 /** Method Constructor.
  *@param nameIn -
  *@param priceIn -
  */  
   public OnlineArticle(String nameIn, double priceIn) {
      super(nameIn, priceIn);
      
      wordCount = 0;
   }
   /** set Word count method.
    *@param wordCountIn -
    */
   public void setWordCount(int wordCountIn) {
      wordCount = wordCountIn;
   }
}
