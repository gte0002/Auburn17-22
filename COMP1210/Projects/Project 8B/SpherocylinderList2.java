import java.text.DecimalFormat;
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;
/** Program linked to Spherocylinder.
 * Project 7
 *@ Gabriel Emerson - Comp 1210 - 007
 *@ October 25, 2017
 */
public class SpherocylinderList2 {

   private String listName;
   private Spherocylinder[] list;
   private int elements;
   
   //Constructor
   /** Public constructor.
    *@param listNameIn -not used
    *@param listIn -not used
    *@param elementsIn -not used
    */
   public SpherocylinderList2(String listNameIn, 
      Spherocylinder[] listIn, int elementsIn) {
      listName = listNameIn;
      list = listIn;
      elements = elementsIn;
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
      for (int i = 0; i < list.length; i++) {
         if (list[i] != null) {
            numberOf++;
         }
      }
      return numberOf;
   }
   /** Finds total Surface Area.
    *@return -total
    */
   public double totalSurfaceArea() {
      double total = 0.0;
      double surfaceArea;
      for (int i = 0; i < list.length; i++) {
         if (list[i] != null) {
            surfaceArea = list[i].surfaceArea();
            total = total + surfaceArea;
         }
      }
      return total;
   }
   /** Finds total volume.
    *@return -total
    */
   public double totalVolume() {
      double total = 0.0;
      double volume;
      for (int i = 0; i < list.length; i++) {
         if (list[i] != null) {
            volume = list[i].volume();
            total = total + volume;
         }
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
      for (int i = 0; i < list.length; i++) {
         if (list[i] != null) {
            output += "\n" + list[i] + "\n";
         }
         index++;
      }
       
      return output;
   }
   /** Finds and sets summary info.
    *@return -
    */
   public String summaryInfo() {
      DecimalFormat fmt = new DecimalFormat("#,##0.0##");
      String summary = "----- Summary for "
         + listName + " -----\nNumber of Spherocylinders: "
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
   public Spherocylinder[] getList() {
      return list;
    
   }
   /** read file method. 
    *@param fileNameIn -not used
    *@return -
    *@throws FileNotFoundException if file cannot open.
    */
   public SpherocylinderList2 readFile(String fileNameIn) 
                                 throws FileNotFoundException {
            
      Scanner scanFile = new Scanner(new File(fileNameIn));
      Spherocylinder[] tList = new Spherocylinder[100];
      String sphListName = "";
      int number = 0;
      String label;
      double radius, cylinderHeight;
      
      listName = scanFile.nextLine(); 
           
      while (scanFile.hasNext()) {
         label = scanFile.nextLine();
         radius = Double.parseDouble(scanFile.nextLine());
         cylinderHeight = Double.parseDouble(scanFile.nextLine());
         
         Spherocylinder sph = new Spherocylinder(label, radius, cylinderHeight);
         tList[number] = sph;
         number++;           
      }
      
      SpherocylinderList2 bList = new SpherocylinderList2(listName, 
                                                            tList, number);
      
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
      
      list[elements] = sph1;
      elements++;
   }
   /** Method to find a Spherocylinder.
    *@param labelIn -
    *@return -output
    */
   public Spherocylinder findSpherocylinder(String labelIn) {
      Spherocylinder output = null;
      for (int i = 0; i < list.length; i++) {
         if (list[i] != null) {
            Spherocylinder sph = list[i];
            if (sph.getLabel().equalsIgnoreCase(labelIn))  {
               output = sph;
            }
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
         
         for (int i = 0; i < list.length - 1; i++) {
            list[i] = list[i + 1];
         }
         list[elements - 1] = null;
         
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
         output = true;
      }
      return output;
   }
   /** Method to find Spherocylinder with shortest radius.
    * @return - obj
    */
   public Spherocylinder findSpherocylinderWithShortestRadius() {
      double sRadius = 0;
      Spherocylinder obj = null;
   
      if (numberOfSpherocylinders() > 0) {
         sRadius = list[0].getRadius();
         obj = list[0];
      }
      
      int index = 0;
      while (index < numberOfSpherocylinders()) {
         if (sRadius > list[index].getRadius()) {
            sRadius = list[index].getRadius();
            obj = list[index];
         }
         index++;  
      }   
      
      return obj;
   }
    /** Method to find Spherocylinder with longest radius.
    *@return -obj
    */
   public Spherocylinder findSpherocylinderWithLongestRadius() {
      double lRadius = 0;
      Spherocylinder obj = null;
      
      if (numberOfSpherocylinders() > 0) {
         lRadius = list[0].getRadius();
         obj = list[0];
         int index = 0;
         while (index < numberOfSpherocylinders()) {
            if (lRadius < list[index].getRadius()) {
               lRadius = list[index].getRadius();
               obj = list[index];
            }
            index++;  
         }   
      }
      return obj;
   
   }
    /** Method to find Spherocylinder with shortest volume.
    *@return -output
    */
   public Spherocylinder findSpherocylinderWithSmallestVolume() {
      double volume = 0;
      Spherocylinder output = null;
   
      if (numberOfSpherocylinders() > 0) {
         volume = list[0].volume();
         output = list[0];
      }
      
      int index = 0;
      while (index < numberOfSpherocylinders()) {
         if (volume > list[index].volume()) {
            volume = list[index].volume();
            output = list[index];
         }
         index++;  
      }   
      
      return output;
   
   
   }
    /** Method to find Spherocylinder with longest volume.
    *@return output
    */
   public Spherocylinder findSpherocylinderWithLargestVolume() {
      double volume = 0;
      Spherocylinder output = null;
   
      if (numberOfSpherocylinders() > 0) {
         volume = list[0].volume();
         output = list[0];
      }
      
      int index = 0;
      while (index < numberOfSpherocylinders()) {
         if (volume < list[index].volume()) {
            volume = list[index].volume();
            output = list[index];
         }
         index++;  
      }   
      
      return output;
   
   }
}