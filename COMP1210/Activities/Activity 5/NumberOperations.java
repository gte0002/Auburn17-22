/** Program linked to Number Operations Driver.
 * Activity 5
 *@ Gabriel Emerson - Comp 1210 - 007
 *@ October 4, 2017
 */
public class NumberOperations {
   private int number;
   /** Constructor.
    * has no returns
    *@param numberIn -not used
    */
   public NumberOperations(int numberIn) {
   
      number = numberIn;
   
   }
   /** getValue method.
    *@return -number
    */
   public int getValue() {
      return number; 
   }
   /** String method for odds under.
    *@return -output
    */
   public String oddsUnder() {
      String output = "";
      int i = 0;
      while (i < number) {
         if (i % 2 != 0) {
            output += i + "\t";
         }
         i++;
      }
      return output; 
   }
   /** String method for powers two under.
    *@return -output
    */
   public String powersTwoUnder() {
      String output = "";
      int powers = 1;
      while (powers < number) {
         output += powers + "\t";
         powers = powers * 2;
      }
      return output;
   }
   /** Method for isGreater.
    *@param compareNumber -not used
    *@return -0
    */
   public int isGreater(int compareNumber) {
      if (number > compareNumber) {
         return 1;
      }
      else if (number < compareNumber) {
         return -1;
      }
      else {
         return 0;
      }
   }
   /** To String method.
    *@return -String
    */
   public String toString() {
      return number + "";
   }

}