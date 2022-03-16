import java.util.ArrayList;
 /** Program to obtain temperature.
  * Activity 6
  *@ Gabriel Emerson - Comp 1210 - 007
  *@ October 16, 2017
  */
public class Temperatures {
   private ArrayList<Integer> temperatures = new ArrayList<Integer>();
  /** Constructor.
   *@param temperaturesIn -not used
   */
   public Temperatures(ArrayList<Integer> temperaturesIn) {
      temperatures = temperaturesIn;
   
   }
  /** Method to get lowest temp.
   *@return low
   */ 
   public int getLowTemp() {
      if (temperatures.isEmpty()) {
         return 0;
      }
      int low = temperatures.get(0);
      for (int i = 0; i < temperatures.size(); i++) {
         if (temperatures.get(i) < low) {
            low = temperatures.get(i);
         }
      }
      return low;
   }
  /** Method to obtain highest temp.
   *@return high
   */
   public int getHighTemp() {
      if (temperatures.isEmpty()) {
         return 0;
      }
      int high = temperatures.get(0);
      for (Integer temp : temperatures) {
         if (temp > high) {
            high = temp;
         }
      }
      return high;
   }
  /** Method to lower minimum.
   *@param lowIn -not used
   *@return lowIn < getLowTemp() ? lowIn : getLowTemp()
   */
   public int lowerMinimum(int lowIn) {
      return lowIn < getLowTemp() ? lowIn : getLowTemp();
   }
  /** Method to raise maximum.
   *@param highIn -not used
   *@return highIn > getHighTemp() ? highIn : getHighTemp()
   */
   public int higherMaximum(int highIn) {
      return highIn > getHighTemp() ? highIn : getHighTemp();
   }
  /** The toString method.
   *@return temperatures
   */
   public String toString() {
      return "\tTemperatures: " + temperatures
           + "\n\tLow: " + getLowTemp()
           + "\n\tHigh: " + getHighTemp();
   }

}