/** Test methods for Division.
 * Gabriel Emerson 
 * Comp 1210 - 007
 * Dec 4, 2017
 */
public class Division {
   /** Integer divide method.
    *@param num -
    *@param den -
    *@return -
    */
   public static int intDivide(int num, int den) {
      try {
         return num / den;
      }
      catch (ArithmeticException e) {
         return 0;
      }
   }
   /** DEcimal divide method.
    *@param num -
    *@param den -
    *@return -
    */
   public static float decimalDivide(int num, int den) {
      if (den == 0) {
         throw new IllegalArgumentException("The denominator "
               + "cannot be zero.");
      }
      return (float) num / den;
   }
}