import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
/** Program linked to Spherocylinder.
 * Project 5
 *@ Gabriel Emerson - Comp 1210 - 007
 *@ October 6, 2017
 */

public class SpherocylinderListApp {
    /** Main method.
     *@param args -not used
     *@throws FileNotFoundException 
     */
   public static void main(String[] args) throws FileNotFoundException {
      Scanner scan = new Scanner(System.in);
      String name = "";
      System.out.print("Enter file name: ");
      ArrayList<Spherocylinder> list = new ArrayList<Spherocylinder>();
      String fileName = scan.nextLine();
      Scanner reader = 
         new Scanner(new File(fileName));
      
      if (reader.hasNext()) {
         name = reader.nextLine();
      }
      
      while (reader.hasNext()) {
         double rad;
         double cylHeight;
         String label = reader.nextLine();
         rad = Double.parseDouble(reader.nextLine());
         cylHeight = Double.parseDouble(reader.nextLine());
         list.add(new Spherocylinder(label, rad, cylHeight));
      
      }
      SpherocylinderList sphList = new SpherocylinderList(name, list);
      System.out.println();
      System.out.println(sphList);
      System.out.println();
      System.out.println(sphList.summaryInfo());
   
   }

}