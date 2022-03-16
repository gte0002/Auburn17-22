import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import java.text.DecimalFormat;

/**   */
public class SpherocylinderTest {


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }
   /**   */
   @Test public void getLabelTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertEquals("getLabelTest", "Example", sph.getLabel());
   }
   /**   */
   @Test public void setLabelTest1() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertFalse("setLabelTest1", sph.setLabel(null));
   }
   /**   */
   @Test public void setLabelTest2() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertTrue("setLabelTest2", sph.setLabel("Label"));
      Assert.assertEquals("setLabelTest2", sph.getLabel(), "Label");
   }
   /**   */
   @Test public void getRadiusTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertEquals("getRadiusTest", 9.4, sph.getRadius(), 0.0001);
   }
   /**   */
   @Test public void setRadiusTest1() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertFalse("setRadiusTest1", sph.setRadius(-1));
   }
   /**   */
   @Test public void setRadiusTest2() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertTrue("setRadiusTest2", sph.setRadius(1));
      Assert.assertEquals("setRadiusTest2", sph.setRadius(1), true);
   }
   /**   */
   @Test public void getCylinderHeightTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertEquals("getCylinderHeightTest", 6.3, 
                                             sph.getCylinderHeight(), 0.0001);
   }
   /**   */
   @Test public void setCylinderHeightTest1() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertFalse("setCylinderHeightTest1", sph.setCylinderHeight(-1));
   }
   /**   */
   @Test public void setCylinderHeightTest2() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertTrue("setCylinderHeightTest2", sph.setCylinderHeight(1));
      Assert.assertEquals("setCylinderHeightTest2", 
                           sph.setCylinderHeight(1), true);
   }   
   /**   */
   @Test public void cicumferenceTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      double var = 2 * Math.PI * 9.4;
      Assert.assertEquals("circumferenceTest", var, 
                                             sph.circumference(), 0.0001);
   }
   /**   */
   @Test public void surfaceAreaTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      double var = sph.circumference() * (2 * sph.getRadius()  
         + sph.getCylinderHeight());
      Assert.assertEquals("surfaceAreaTest", var, sph.surfaceArea(), 0.0001);
   }
   /**   */
   @Test public void volumeTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      double var = Math.PI * Math.pow(9.4, 2) * ((4.0 / 3.0) 
         * sph.getRadius() + sph.getCylinderHeight());
      Assert.assertEquals("volumeTest", var, sph.volume(), 0.0001);
   }
   /**   */
   @Test public void toStringTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      DecimalFormat fmt1 = new DecimalFormat("#,##0.0##");
      String expected = "Spherocylinder \"" + sph.getLabel() 
         + "\" with radius " + fmt1.format(sph.getRadius()) 
         + " and cylinder height " 
         + fmt1.format(sph.getCylinderHeight()) + " has:"
         + "\n\tcircumference = " + fmt1.format(sph.circumference()) 
         + " units" + "\n\tsurface area = " + fmt1.format(sph.surfaceArea()) 
         + " square units" + "\n\tvolume = " + fmt1.format(sph.volume()) 
         + " cubic units";
      Assert.assertEquals("toStringTest", expected, sph.toString());
   }
   /**   */
   @Test public void getCountTest() {
      Spherocylinder sph = new Spherocylinder("Example", 9.4, 6.3);
      sph.resetCount();
      Assert.assertEquals("getCountTest", 0, sph.getCount());
   }
   /**   */
   @Test public void equalsTest() {
      Spherocylinder sph1 = new Spherocylinder("Example", 9.4, 6.3);
      Spherocylinder sph2 = new Spherocylinder("Example", 9.4, 6.3);
      Assert.assertEquals("equals test",
                        true, sph1.equals(sph2));
      
      sph2 = new Spherocylinder("Example2", 9.4, 6.3);
      Assert.assertEquals("equals false test",
                        false, sph1.equals(sph2));
      
      sph2 = new Spherocylinder("Example", 9.5, 6.3);
      Assert.assertEquals("equals false test",
                        false, sph1.equals(sph2));
      
      sph2 = new Spherocylinder("Example", 9.4, 6.2);
      Assert.assertEquals("equals false test",
                        false, sph1.equals(sph2));
      
      Assert.assertEquals("equals false test",
                        0, sph1.hashCode());
   }
}
