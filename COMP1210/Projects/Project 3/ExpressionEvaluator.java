import java.util.Scanner;
import java.text.DecimalFormat;

/** Program evaluate expressions.
* Project 3
* @ Gabriel Emerson - Comp 1210 - 001
* @ Sep 20, 2017
*/
 
public class ExpressionEvaluator {
   /** Scans Expressions.
   *@param args -not used
   */
   public static void main(String[] args) {
      Scanner userInput = new Scanner(System.in);
      double result = 0;
      double value = 0;
      
      System.out.print("Enter a value for x: ");
      value = userInput.nextDouble();
      
      result = Math.sqrt(Math.abs(23.7 * Math.pow(value, 9)) - value) 
         / (7.3 * Math.pow(value, 2) + 5.2 * value + 3.1);
     
      System.out.println("Result: " + result);
      String strResult = Double.toString(result);
      int count = strResult.length();
      
      int index = strResult.indexOf('.');
      int right = count - index - 1;
     
      System.out.println("# digits to left of decimal point: "  
         + index);
     
      System.out.println("# digits to right of decimal point: " 
         + right);
     
      DecimalFormat df = new DecimalFormat("#,##0.0####");
     
      System.out.print("Formatted Result: ");
      System.out.print(df.format(result));
   
   }
   
}