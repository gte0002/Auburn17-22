/** Program to create and use Arrays.
 * Activity 7
 *@ Gabriel Emerson - Comp 1210 - 007
 *@ October 23, 2017
 */
public class Scores {
   private int[] numbers;
  /** Constrcutor.
   *@param numbersIn -not used.
   */
   public Scores(int[] numbersIn) {
      numbers = numbersIn;
   }
  /** Finds the even values.
   *@return -evens
   */
   public int[] findEvens() {
      int numberEvens = 0;
      
      for (int i = 0; i < numbers.length; i++) {
         if (numbers[i] % 2 == 0) {
            numberEvens++;
         }
      }
      
      int[] evens = new int [numberEvens];
      
      int count = 0;
      for (int i = 0; i < numbers.length; i++) {
         if (numbers[i] % 2 == 0) {
            evens[count] = numbers[i];
            count++;
         }
      }
      return evens;
   }
  /** Find the odd values.
   *@return -odds
   */
   public int[] findOdds() {
      int numberOdds = 0;
      
      for (int i = 0; i < numbers.length; i++) {
         if (numbers[i] % 2 == 1) {
            numberOdds++;
         }
      }
      
      int[] odds = new int [numberOdds];
      
      int count = 0;
      for (int i = 0; i < numbers.length; i++) {
         if (numbers[i] % 2 == 1) {
            odds[count] = numbers[i];
            count++;
         }
      }
      return odds;
   
   }
  /** Calculate average.
   *@return -sum / length of list
   */
   public double calculateAverage() {
      int sum = 0;
     
      for (int i = 0; i < numbers.length; i++) {
         sum += numbers[i];
      }
      return sum / numbers.length;
   }
  /** Numbers in order.
   *@return -result
   */
   public String toString() {
      String result = "";
      
      for (int i = 0; i < numbers.length; i++) {
         result += numbers[i] + "\t";
      }
      return result;
   }
  /** Numbers in reverse.
   *@return -result
   */
   public String toStringInReverse() {
      String result = "";
      
      for (int i = numbers.length - 1; i >= 0; i--) {
         result += numbers[i] + "\t";
      }
      return result;
   
   }

}