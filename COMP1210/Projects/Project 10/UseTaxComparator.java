import java.util.Comparator;
/** Extends Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 29, 2017
 */
public class UseTaxComparator implements Comparator<Vehicle> {
   /** Compare method.
    *@param v1 -
    *@param v2 -
    *@return -
    */
   public int compare(Vehicle v1, Vehicle v2) {
      if (v1.useTax() > v2.useTax()) {
         return 1;
      }
      else if (v1.useTax() < v2.useTax()) {
         return -1;
      }
      return 0;
   }
}