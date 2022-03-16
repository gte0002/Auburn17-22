import java.util.Scanner;
import java.util.Random;
import java.text.DecimalFormat;


/** Program to scan artificial ticket.
* Project 3
* @ Gabriel Emerson - Comp 1210 - 001
* @ Sep 20, 2017
*/
 
public class MoonTrip {

   static final double STUDENT_DISCOUNT = .40; 
   static final double EMPLOYEE_DISCOUNT = .20;
         /** Scans an artificial trip ticket.
   *@param args -not used
   */
   
   public static void main(String[] args) {
      Scanner userInput = new Scanner(System.in);
      Random generator = new Random();
      DecimalFormat fmt1 = new DecimalFormat("$#,##0.00");
      DecimalFormat fmt2 = new DecimalFormat("0000");
     
      System.out.print("Enter ticket code: ");
      String input = userInput.nextLine();
      input = input.trim();
      
      if (input.length() <= 25) {
         System.out.println("\n*** Invalid ticket code ***");
         System.out.println("Ticket code must have at least 26 characters.");
      }
      
      else {  
         String mM = input.substring(0, 2);
         String dD = input.substring(2, 4);
         String yY = input.substring(4, 8);
         String hour = input.substring(8, 10);
         String minutes = input.substring(10, 12);
         String seat = input.substring(22, 25);
         String iten = input.substring(25);
         String price = input.substring(13, 20);
         char c = input.charAt(12);
         String cost = input.substring(13, 20);
         double costD = Double.parseDouble(cost);
         int prizeNumber = generator.nextInt(10000);
         fmt2.format(prizeNumber);
         double priceD = Double.parseDouble(price);
         
      
         System.out.print("\nDate: " + mM + "/" + dD + "/" + yY + "   ");
         System.out.print("Time: " + hour + ":" + minutes + "   ");
         System.out.print("Seat: " + seat + "   ");
         System.out.print("\nItenerary: " + iten);
         System.out.print("\nPrice: " + fmt1.format(priceD) + "   ");
         System.out.print("Category: " + c + "   ");
      
         if (c == 's') {
            System.out.print("Cost: " 
               + fmt1.format(costD - (costD * STUDENT_DISCOUNT)));
         }
         else if (c == 'e') {
            System.out.print("Cost: " 
               + fmt1.format(costD - (costD * EMPLOYEE_DISCOUNT)));
         }
         else {
            System.out.print("Cost: " + fmt1.format(costD));
         }
         System.out.print("\nPrize Number: " + fmt2.format(prizeNumber));
      }
      
         
   }
}