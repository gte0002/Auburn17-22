/** Exception program for Vehcile.
 *@ Gabriel Emerson
 * Comp 1210 - 007
 * Dec 8, 2017
 */
public class NegativeValueException extends Exception {
   /**
    *@param negativeValue -
    */
   public NegativeValueException() {
      super("Numeric values must be nonnegative");
   }


}