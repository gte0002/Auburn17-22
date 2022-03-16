import java.util.Scanner;
import java.io.FileNotFoundException;
import java.util.ArrayList;
/** Program linked to Spherocylinder.
 * Project 6
 *@ Gabriel Emerson - Comp 1210 - 007
 *@ October 18, 2017
 */
public class SpherocylinderListMenuApp {
/**
 * @param args - is not used.
 * @throws FileNotFoundException if the file cannot be opened.
 */
   public static void main(String[] args) throws FileNotFoundException {
      Scanner scan = new Scanner(System.in);
      String code = "";
      String listName = "no list name";
      String fileName = "no file name";
      ArrayList<Spherocylinder> aList = new ArrayList<Spherocylinder>();
      SpherocylinderList sphList = new SpherocylinderList(listName, aList);
      String label;
      double radius, cylinderHeight;
      
      System.out.println("Spherocylinder List System Menu\n"
                       + "R - Read File and Create Spherocylinder List\n"
                       + "P - Print Spherocylinder List\n" 
                       + "S - Print Summary\n"
                       + "A - Add Spherocylinder\n"   
                       + "D - Delete Spherocylinder\n"   
                       + "F - Find Spherocylinder\n"
                       + "E - Edit Spherocylinder\n"
                       + "Q - Quit");
   
   
      do {
         System.out.print("Enter Code [R, P, S, A, D, F, E, or Q]: ");
         code = scan.nextLine();
         if (code.length() == 0) {
            continue;
         }
         code = code.toUpperCase();
         char codeChar = code.charAt(0);
         switch(codeChar) {
            case 'R':
               System.out.print("\tFile name: ");
               fileName = scan.nextLine();
            
               sphList = sphList.readFile(fileName);
            
               System.out.println("\tFile read in and "
                              + "Spherocylinder List created\n");
               break; 
            
            case 'P': 
               System.out.println(sphList);
               break;
               
            case 'S': 
               System.out.println("\n\tSummary: " 
                                    + sphList.summaryInfo() + "\n");
               break;
         
            case 'A': 
               System.out.print("\tLabel: ");
               label = scan.nextLine();
               System.out.print("\tRadius: ");
               radius = Double.parseDouble(scan.nextLine());
               System.out.print("\tCylinder Height: ");
               cylinderHeight = Double.parseDouble(scan.nextLine());
            
               sphList.addSpherocylinder(label, radius, cylinderHeight);
               System.out.println("\t*** Spherocylinder added ***\n");
               break; 
         
            case 'D': 
               System.out.print("\tLabel: ");
               label = scan.nextLine();
            
               if (sphList.deleteSpherocylinder(label) != null) {
                  System.out.println("\t\"" + label + "\" deleted\n");
               }
               else {
                  System.out.println("\t\"" + label + "\" not found\n");
               }
               break;
               
            case 'F':
               System.out.print("\tLabel: ");
               label = scan.nextLine();
               
               if (sphList.findSpherocylinder(label) != null) {
                  System.out.println(sphList.findSpherocylinder(label) + "\n");
               }
               else {
                  System.out.println("\t\"" + label + "\" not found\n");
               }
               break;
               
            case 'E':
               System.out.print("\tLabel: ");
               label = scan.nextLine();
               if (sphList.findSpherocylinder(label) != null) {
                  System.out.print("\tRadius: ");
                  radius = Double.parseDouble(scan.nextLine());
                  System.out.print("\tCylinder Height: ");
                  cylinderHeight = Double.parseDouble(scan.nextLine());
                  System.out.println("\"" + label + "\"" 
                     + " successfully edited");
               }
               else {
                  System.out.println("\"" + label + "\"" 
                     + " not found");
               }
               break;
               
            default:
               System.out.println("\t*** Invalid code ***\n");
               break;
               
            case 'Q': 
               break;
         }
      } while (!code.equalsIgnoreCase("Q"));
   
   }

}