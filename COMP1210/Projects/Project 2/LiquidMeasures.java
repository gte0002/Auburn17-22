import java.util.Scanner;

/** Program to scan measurements.
* Project 2
* @ Gabriel Emerson - Comp 1210 - 001
* @ Sep 7, 2017
*/
 
public class LiquidMeasures {
/** Scans .
*@param args -not used
*/

   public static void main(String[] args) {
      Scanner userInput = new Scanner(System.in);
      int barrels = 0;
      int gallons = 0;
      int quarts = 0;
      int ounces = 0;
      
      System.out.print("Enter amount of liquid in ounces: ");
      ounces = userInput.nextInt();
      if (ounces < 1000000000) {
         
         System.out.println("Measures by volume:");
         
         System.out.println("\tBarrels: " + ounces / 5376);
         int barrels2 = ounces % 5376;
         
         System.out.println("\tGallons: " + barrels2 / 128);
         int gallons2 = barrels2 % 128;
         
         System.out.println("\tQuarts: " + gallons2 / 32);
         int quarts2 = gallons2 % 32;
         
         System.out.println("\tOunces: " + quarts2 % 1000000000);
         int ounces2 = quarts2 % 1000000000;
         
         System.out.println(ounces + " oz = (" + ounces / 5376
            + " bl * 5376 oz) + (" + barrels2 / 128 + " gal * 128 oz) + ("
            + gallons2 / 32 + " qt * 32 oz) + (" + ounces2 + " oz)");
      }
      else {
         System.out.println("Amount must not exceed 1,000,000,000.");
      }
   }
}