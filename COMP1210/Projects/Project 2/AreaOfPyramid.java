import java.util.Scanner;

/** Program to scan the area of a pyramid.
* Project 2
* @ Gabriel Emerson - Comp 1210 - 001
* @ Sep 7, 2017
*/
 
public class AreaOfPyramid {
/** Scans name, age, gender, and max heart rate.
*@param args -not used
*/
   public static void main(String[] args) {
      
      Scanner userInput = new Scanner(System.in);
      double base = 0;
      double slantHeight = 0;
   
   //Prompt the user for values
      System.out.println("Enter values for base and "
         + "slant height of a pyramid: ");
      System.out.print("\tbase = ");
      base = userInput.nextDouble();
      System.out.print("\tslant height = ");
      slantHeight = userInput.nextDouble();
      double area = base * base + 4 * (base * slantHeight) / 2;
   
      System.out.println("\nA pyramid with base = " 
         + base + " and slant height = " + slantHeight
         + "\nhas an area of " + area + " square units.");
   
   }
   
}