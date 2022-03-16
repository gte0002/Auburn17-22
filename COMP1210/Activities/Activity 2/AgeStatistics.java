import java.util.Scanner;

/** Program to scan Age in years, minutes, and centuries.
* Activity 2
* @ Gabriel Emerson - Comp 1210 - 001
* @ Sep 5, 2017
*/
 
public class AgeStatistics {
/** Scans name, age, gender, and max heart rate.
*@param args -not used
*/
   public static void main(String[] args) {
   
      Scanner userInput = new Scanner(System.in);
      String name = " ";
      int ageInYears = 0;
      int gender = 0;
      double maxHeartRate = 0;
   
   //Prompt the user for their name:
      System.out.print("Enter your name: ");
      name = userInput.nextLine();
   
   //Prompt the user for their age:
      System.out.print("Enter your age in years: ");
      ageInYears = userInput.nextInt();
   
   //Prompt the user for their gender:
      System.out.print("Enter your gender (1 for female and 0 for male): ");
      gender = userInput.nextInt();
      
   //convert age
      System.out.println("\tYour age in minutes is "
         + ageInYears * 525600 + " minutes.");
      System.out.println("\tYour age in centuries is "
         + (double) ageInYears / 100 + " centuries.");
   //display max heart rate
      System.out.print("Your max heart rate is ");
      if (gender == 1) { //calculate female MHR
         System.out.println(209 - (0.7 * ageInYears) + " beats per minute.");
      }
      else { //calculate male MHR
         System.out.println(214 - (0.8 * ageInYears) + " beats per minute.");
      }
      
   }
   
   
}