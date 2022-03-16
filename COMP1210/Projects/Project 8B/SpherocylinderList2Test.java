import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import java.text.DecimalFormat;
import java.io.IOException;
/** Test file for SpherocylinderList2.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 10, 2017
 */

public class SpherocylinderList2Test {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }


   /** Test getName method.
    *
    */
   @Test public void getNameTest() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertEquals("getNameTest", "Example", sph.getName());
   }
   /** Test number of Spherocylinders if the number is not null.
    *
    */
   @Test public void numberOfSpherocylindersTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertEquals("numberOfSpherocylindersTest1", 2, 
                          sph.numberOfSpherocylinders());
   }
   /** Test number of Spherocylinders if the number is null.
    *
    */
   @Test public void numberOfSpherocylindersTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertEquals("numberOfSpherocylindersTest2", 0, 
                          sph.numberOfSpherocylinders());
   }
   /** Test total surface area method if there is a list.
    *
    */
   @Test public void totalSurfaceAreaTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double total = sph1.surfaceArea() + sph2.surfaceArea();
      Assert.assertEquals("totalSurfaceAreaTest1", total, 
                          sph.totalSurfaceArea(), 0.000001);
   }
   /** Method to test total surface Area if list is null.
    *
    */
   @Test public void totalSurfaceAreaTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double total = sph1.surfaceArea() + sph2.surfaceArea();
      Assert.assertEquals("totalSurfaceAreaTest2", 0.0, 
                          sph.totalSurfaceArea(), 0.000001);
   }
   /** Method to test total volume if list is not null.
    *
    */
   @Test public void totalVolumeTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double total = sph1.volume() + sph2.volume();
      Assert.assertEquals("totalVolumeTest1", total, 
                          sph.totalVolume(), 0.000001);
   }
   /** Method to test volume if list is null.
    *
    */
   @Test public void totalVolume2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double total = sph1.volume() + sph2.volume();
      Assert.assertEquals("totalVolumeTest2", 0.0, 
                          sph.totalVolume(), 0.000001);
   }
   /** Method to test average surface Area if # of is > 0.
    *
    */
   @Test public void averageSurfaceAreaTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double average = sph.totalSurfaceArea() / sph.numberOfSpherocylinders();
      Assert.assertEquals("averageSurfaceAreaTest1", average, 
                          sph.averageSurfaceArea(), 0.000001);
   }
   /** Method to test average surface Area if # of is 0.
    *
    */
   @Test public void averageSurfaceAreaTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double average = sph.totalSurfaceArea() / sph.numberOfSpherocylinders();
      Assert.assertEquals("averageSurfaceAreaTest2", 0.0, 
                          sph.averageSurfaceArea(), 0.000001);
   }
   /** Method to test average volume if # of is > 0.
    *
    */
   @Test public void averageVolume1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double average = sph.totalVolume() / sph.numberOfSpherocylinders();
      Assert.assertEquals("averageVolume1", average, 
                          sph.averageVolume(), 0.000001);
   }
   /** Method to test average volume if # of is 0.
    *
    */
   @Test public void averageVolume2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      double average = sph.totalVolume() / sph.numberOfSpherocylinders();
      Assert.assertEquals("averageVolume2", 0.0, 
                          sph.averageVolume(), 0.000001);
   }
   /** Method to test the toString method in list if # of is > 0.
    *
    */
   @Test public void toStringTest() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
   
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      DecimalFormat fmt1 = new DecimalFormat("#,##0.0##");
      String output = sph.getName() + "\n" + "\nSpherocylinder \"" 
         + sph1.getLabel() 
         + "\" with radius " + fmt1.format(sph1.getRadius()) 
         + " and cylinder height " 
         + fmt1.format(sph1.getCylinderHeight()) + " has:"
         + "\n\tcircumference = " + fmt1.format(sph1.circumference()) 
         + " units" + "\n\tsurface area = " + fmt1.format(sph1.surfaceArea()) 
         + " square units" + "\n\tvolume = " + fmt1.format(sph1.volume()) 
         + " cubic units";
      String output2 = "\n" + "\nSpherocylinder \"" 
         + sph2.getLabel() + "\" with radius " 
         + fmt1.format(sph2.getRadius()) + " and cylinder height " 
         + fmt1.format(sph2.getCylinderHeight()) + " has:"
         + "\n\tcircumference = " + fmt1.format(sph2.circumference()) 
         + " units" + "\n\tsurface area = " + fmt1.format(sph2.surfaceArea()) 
         + " square units" + "\n\tvolume = " + fmt1.format(sph2.volume()) 
         + " cubic units\n";
      output += output2;
      Assert.assertEquals("toStringTest1", output, sph.toString());
   }
   /** Method to test the toString method in list if # of is = 0.
    *
    */
   @Test public void toStringTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
   
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertEquals("toStringTest2", sph.getName() 
         + "\n", sph.toString());
   }
   /**
    *
    */
   @Test public void summaryInfoTest() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
   
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      DecimalFormat fmt = new DecimalFormat("#,##0.0##");
      String summary = "----- Summary for "
         + sph.getName() + " -----\nNumber of Spherocylinders: "
         + sph.numberOfSpherocylinders() + "\nTotal Surface Area: "
         + fmt.format(sph.totalSurfaceArea()) + "\nTotal Volume: " 
         + fmt.format(sph.totalVolume()) + "\nAverage Surface Area: "
         + fmt.format(sph.averageSurfaceArea()) + "\nAverage Volume: "
         + fmt.format(sph.averageVolume());
      Assert.assertEquals("summaryInfoTest", summary, sph.summaryInfo());
   }
   /** Tests the getList method.
    *
    */
   @Test public void getListTest() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertArrayEquals("getListTest", array, sph.getList());
   }
   /** Method to test readfile method.
    *@throws IOException 
    */
   @Test public void readFileTest() throws IOException {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[2];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      sph = sph.readFile("Spherocylinder_data_1.txt");
      
      Assert.assertEquals("readFile Test",
                           "Spherocylinder Test List", sph.getName());
   }
   /** Method to test add Spherocylinder.
    *
    */
   @Test public void addSpherocylinderTest() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Spherocylinder sph3 = new Spherocylinder("AddExample", 1.0, 1.0);
      sph.addSpherocylinder("AddExample", 1.0, 1.0);
      Spherocylinder[] array2 = sph.getList();
         
      Assert.assertEquals("addSpherocylinderTest",
                           sph3, array2[2]);
   }
   /** Method to test finding a Spherocylinder if # of != null.
    *
    */
   @Test public void findSpherocylinderTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertEquals("findSpherocylinderTest", sph1, array[0]);
   }
   /** Method to test finding a Spherocylinder if # of = null.
    *
    */
   @Test public void findSpherocylinderTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Assert.assertEquals("findSpherocylinderTest", null, array[0]);
   }
   /** Method to test delete Spherocylinder if # of != null.
    *
    */
   @Test public void deleteSpherocylinderTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Spherocylinder[] array2 = sph.getList();
      String label = sph2.getLabel();
      sph.deleteSpherocylinder(label);
      Assert.assertEquals("deleteSpherocylinderTest", null, array2[1]);
   }
   /** Method to test delete Spherocylinder if # of = null.
    *
    */
   @Test public void deleteSpherocylinderTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Spherocylinder[] array2 = sph.getList();
      String label = sph2.getLabel();
      sph.deleteSpherocylinder(label);
      Assert.assertEquals("deleteSpherocylinderTest", null, array2[0]);
   }
   /** Method to test editSpherocylinder if # of != null.
    *
    */
   @Test public void editSpherocylinderTest1() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
      array[0] = sph1;
      array[1] = sph2;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Spherocylinder[] array2 = sph.getList();
      String label = sph2.getLabel();
      double radius = 2.9;
      double cylinderHeight = 3.1;
      Assert.assertTrue("editSpherocylinderTest1", 
               sph.editSpherocylinder("Example", radius, cylinderHeight));
   }
   /** Method to test editSpherocylinder if # of = null.
    *
    */
   @Test public void editSpherocylinderTest2() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 2.4, 1.2);
      Spherocylinder[] array = new Spherocylinder[5];
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 2);
      Spherocylinder[] array2 = sph.getList();
      String label = sph2.getLabel();
      double radius = 2.9;
      double cylinderHeight = 3.1;
      String newName = "New Example";
      String answer = "New Example" + radius + cylinderHeight;
      Assert.assertFalse("editSpherocylinderTest1", 
               sph.editSpherocylinder(newName, radius, cylinderHeight));
   }
   /** Method to findSpherocylinderWithShortestRadius.
    *
    */
   @Test public void findSpherocylinderWithShortestRadiusTest1() {
      Spherocylinder[] array = new Spherocylinder[5];
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example1", 2.4, 1.2);
      Spherocylinder sph3 = new Spherocylinder("Example2", 3.4, 1.2);
   
      array[0] = sph1;
      array[1] = sph2;
      array[2] = sph3;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 3);
      Assert.assertEquals("smallestRadius Test", sph2,
                           sph.findSpherocylinderWithShortestRadius());
      
      Spherocylinder[] array1 = new Spherocylinder[5];
   
      SpherocylinderList2 sph12 = new SpherocylinderList2("Test List", 
                                                         array1, 0);
      Assert.assertEquals("smallestRadius Test", null,
                           sph12.findSpherocylinderWithShortestRadius());
   }
   /** Method to findSpherocylinderWithLongestRadius.
    *
    */
   @Test public void findSpherocylinderWithLongestRadiusTest1() {
      Spherocylinder[] array = new Spherocylinder[5];
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example1", 2.4, 1.2);
      Spherocylinder sph3 = new Spherocylinder("Example2", 10.4, 1.2);
   
      array[0] = sph1;
      array[1] = sph2;
      array[2] = sph3;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 3);
      Assert.assertEquals("longestRadius Test", sph3,
                           sph.findSpherocylinderWithLongestRadius());
      
      Spherocylinder[] array1 = new Spherocylinder[5];
      SpherocylinderList2 sph12 = new SpherocylinderList2("Test List", 
                                                         array1, 0);
      Assert.assertEquals("longestRadius Test", null,
                           sph12.findSpherocylinderWithLongestRadius());
   }
   /** Method to findSpherocylinderWithShortestVolume.
    *
    */
   @Test public void findSpherocylinderWithShortestVolumeTest1() {
      Spherocylinder[] array = new Spherocylinder[5];
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example1", 2.4, 1.2);
      Spherocylinder sph3 = new Spherocylinder("Example2", 3.4, 1.2);
   
      array[0] = sph1;
      array[1] = sph2;
      array[2] = sph3;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example", array, 3);
      Assert.assertEquals("smallestRadius Test", sph2,
                           sph.findSpherocylinderWithSmallestVolume());
      
      Spherocylinder[] array1 = new Spherocylinder[5];
   
      SpherocylinderList2 sph12 = new SpherocylinderList2("Test List", 
                                                         array1, 0);
      Assert.assertEquals("smallestRadius Test", null,
                           sph12.findSpherocylinderWithSmallestVolume());
   }
   /** Method to findSpherocylinderWithLargestVolume.
    *
    */
   @Test public void findSpherocylinderWithLargestVolumeTest() {
      Spherocylinder[] array = new Spherocylinder[5];
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example1", 2.4, 1.2);
      Spherocylinder sph3 = new Spherocylinder("Example2", 10.4, 7.0);
   
      array[0] = sph1;
      array[1] = sph2;
      array[2] = sph3;
     
      SpherocylinderList2 sph = new SpherocylinderList2("Example2", array, 3);
      Assert.assertEquals("longestRadius Test", sph3,
                           sph.findSpherocylinderWithLargestVolume());
      
      Spherocylinder[] array1 = new Spherocylinder[5];
   
      SpherocylinderList2 sph12 = new SpherocylinderList2("Test List", 
                                                         array1, 0);
      Assert.assertEquals("longestRadius Test", null,
                           sph12.findSpherocylinderWithLargestVolume());
   }



}