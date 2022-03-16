import java.util.ArrayList;
import java.text.DecimalFormat;
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;
/** Program linked to Spherocylinder.
 * Project 5
 *@ Gabriel Emerson - Comp 1210 - 007
 *@ October 6, 2017
 */
public class SpherocylinderList {

   private String listName;
   private ArrayList<Spherocylinder> list = new ArrayList<Spherocylinder>();
   
   //Constructor
   /** Public constructor.
    *@param listNameIn -not used
    *@param listIn -not used
    */
   public SpherocylinderList(String listNameIn, 
      ArrayList<Spherocylinder> listIn) {
      listName = listNameIn;
      list = listIn;
   }
   //Methods
   /** Method to get name.
    *@return -listName
    */
   public String getName() {
      return listName;
   }
   /** Finds number of Spherocylinders.
    *@return -numberOf
    */
   public int numberOfSpherocylinders() {
      int numberOf = 0;
      if (list.size() > 0) {
         numberOf = list.size();
      }
      return numberOf;
   }
   /** Finds total Surface Area.
    *@return -total
    */
   public double totalSurfaceArea() {
      double total = 0.0;
      double surfaceArea;
      int index = 0;
      while (index < list.size()) {
         surfaceArea = list.get(index).surfaceArea();
         total = total + surfaceArea;
         
         index++;
      }
      return total;
   }
   /** Finds total volume.
    *@return -total
    */
   public double totalVolume() {
      double total = 0.0;
      double volume;
      int index = 0;
      while (index < list.size()) {
         volume = list.get(index).volume();
         total = total + volume;
         
         index++;
      }
      return total;
   }
   /** Finds the average surface area.
    *@return -average
    */
   public double averageSurfaceArea() {
      double average;
      if (numberOfSpherocylinders() > 0) {
         average = totalSurfaceArea() / numberOfSpherocylinders();
         return average;
      }
      else {
         return 0.0;
      }
   }
   /** Finds the average volume.
    *@return -average
    */
   public double averageVolume() {
      double average;
      if (numberOfSpherocylinders() > 0) {
         average = totalVolume() / numberOfSpherocylinders();
         return average;
      }
      else {
         return 0.0;
      }
   
   }
   /** Finds the toString.
    *@return -
    */
   public String toString() {
      String output = listName + "\n";
      int index = 0;
      while (index < list.size()) {
         output += "\n" + list.get(index) + "\n";
         index++;
      }
       
      return output;
   }
   /** Finds and sets summary info.
    *@return -
    */
   public String summaryInfo() {
      DecimalFormat fmt = new DecimalFormat("#,##0.0##");
      String summary = "----- Summary for Spherocylinder "
         + "Empty Test List ----- \nNumber of Spherocylinders: "
         + numberOfSpherocylinders() + "\nTotal Surface Area: "
         + fmt.format(totalSurfaceArea()) + "\nTotal Volume: " 
         + fmt.format(totalVolume()) + "\nAverage Surface Area: "
         + fmt.format(averageSurfaceArea()) + "\nAverage Volume: "
         + fmt.format(averageVolume());
      return summary;
   }
   /** Get list method. 
    *@return -
    */
   public ArrayList<Spherocylinder> getList() {
      return list;
    
   }
   /** read file method. 
    *@param fileNameIn -not used
    *@return -
    *@throws FileNotFoundException if file cannot open.
    */
   public SpherocylinderList readFile(String fileNameIn) 
                                 throws FileNotFoundException {
            
      Scanner scanFile = new Scanner(new File(fileNameIn));
      ArrayList<Spherocylinder> tList = new ArrayList<Spherocylinder>();
      String sphListName = "";
      String label;
      double radius, cylinderHeight;
      
      listName = scanFile.nextLine(); 
           
      while (scanFile.hasNext()) {
         label = scanFile.nextLine();
         radius = Double.parseDouble(scanFile.nextLine());
         cylinderHeight = Double.parseDouble(scanFile.nextLine());
         Spherocylinder sph = new Spherocylinder(label, radius, cylinderHeight);
         tList.add(sph);           
      }
      
      SpherocylinderList bList = new SpherocylinderList(listName, tList);
      
      return bList;
   }

   /** Method to add a Spherocylinder.
    *@param labelIn -
    *@param radiusIn - 
    *@param cylinderHeightIn - 
    */
   public void addSpherocylinder(String labelIn, double radiusIn, 
      double cylinderHeightIn) {
      Spherocylinder sph1 = new Spherocylinder(labelIn, 
                                       radiusIn, cylinderHeightIn);
      
      list.add(sph1);
   
   }
   /** Method to find a Spherocylinder.
    *@param labelIn -
    *@return -output
    */
   public Spherocylinder findSpherocylinder(String labelIn) {
      Spherocylinder output = null;
      int index = -1;
      for (Spherocylinder sph : list) {
         if (sph.getLabel().equalsIgnoreCase(labelIn))  {
            index = list.indexOf(sph);
            output = sph;
         }
      }
      return output;
   }
   /** Method to delete Spherocylinder.
    *@param label - 
    *@return -output
    */
   public Spherocylinder deleteSpherocylinder(String label) {
      Spherocylinder output = null;
      output = findSpherocylinder(label);
      if (output != null) {
         int index = list.indexOf(output);
         list.remove(index);
      }
         
      return output;
   }
   /** Method to edit a Spherocylinder.
    *@param label - 
    *@param radius - 
    *@param cylinderHeight - 
    *@return -output
    */
   public boolean editSpherocylinder(String label, double radius,
      double cylinderHeight) {
      Spherocylinder sph2 = new Spherocylinder(label, radius, cylinderHeight);
      boolean output = false;
      Spherocylinder output2 = null;
      output2 = findSpherocylinder(label);
      if (output2 != null) {
         output2.setRadius(radius);
         output2.setCylinderHeight(cylinderHeight);
      }
      return output;
   }


}