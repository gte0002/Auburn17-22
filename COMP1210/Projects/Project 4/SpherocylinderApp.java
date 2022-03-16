import java.util.Scanner;
/** Program linked to UserInfo.
 * Project 4
 *@ Gabriel Emerson - Comp 1210 - 001
 *@ September 28, 2017
 */
public class SpherocylinderApp {
   /** Main for Sperocylinder.
    *@param args -not used
    */
   public static void main(String[] args) {
      Scanner userInput = new Scanner(System.in);
      System.out.println("Enter label, radius, and cylinder height"
         + "for sperocylinder.");
      System.out.print("\tlabel: ");
      String label = userInput.nextLine();
      label.trim();
      System.out.print("\tradius: ");
      double radius = userInput.nextDouble();
      if (radius < 0) {
         System.out.println("Error: radius must be non-negative.");
         return;
      }
      System.out.print("\tcylinder height: ");
      double cylinderHeight = userInput.nextDouble();
      if (cylinderHeight < 0) {
         System.out.println("Error: cylinder height must be non-negative.");
         return;
      }
     
      Spherocylinder obj = new Spherocylinder(label, radius, cylinderHeight);
      System.out.println("\n" + obj);
      
   }
}