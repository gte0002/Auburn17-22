//New Version
import java.text.DecimalFormat;   
  /** Program linked to Sperrocylinder.
* Project 4
*@ Gabriel Emerson - Comp 1210 - 001
*@ September 28, 2017
*/
public class Spherocylinder {
      
 //instance variables
   private String label = "";
   private double radius = 0;
   private double cylinderHeight = 0;
   private static int count = 0;
  //constructor
  /** constructor insert varaibles.
   *@param labelIn -not used
   *@param radiusIn -not used
   *@param cylinderHeightIn -not used
   */
   public Spherocylinder(String labelIn, double radiusIn, 
       double cylinderHeightIn) {
      setLabel(labelIn);
      setRadius(radiusIn);
      setCylinderHeight(cylinderHeightIn);
      count++;
   }
   //methods
   /** method output.
    *@return -label
    */
   public String getLabel() {
      return label;
   }
   /** method for setting label.
    *@return -isSet
    *@param labelIn -not used
    */
   public boolean setLabel(String labelIn) {
      boolean isSet = false;
      if (labelIn != null) {
         label = labelIn.trim();
         isSet = true; 
      }
      return isSet; 	
   }
   /** method for getting radius.
    *@return -radius
    */
   public double getRadius() {
      return radius;
   }
   /** method sets the radius.
    *@return -isSet
    *@param radiusIn -not used
    */
   public boolean setRadius(double radiusIn) {
      boolean isSet = false;
      if (radiusIn >= 0) {
         radius = radiusIn;
         isSet = true; 
      }
      return isSet; 	
   }
   /** Method to get cylinder height.
    *@return -cylinderHeight
    */
   public double getCylinderHeight() {
      return cylinderHeight;
   }
   /** method sets the cylinder Height.
    *@return -isSet
    *@param cylinderHeightIn -not used
    */
   public boolean setCylinderHeight(double cylinderHeightIn) {
      boolean isSet = false;
      if (cylinderHeightIn >= 0) {
         cylinderHeight = cylinderHeightIn;
         isSet = true; 
      }
      return isSet;
   }
   /** method gets the circumference.
    *@return -circumference
    */
   public double circumference() {
      double circumference = 2 * Math.PI * radius;
      return circumference;
   }
   /** method gets the surface area.
    *@return -surfaceArea
    */
   public double surfaceArea() {
      double surfaceArea = circumference() * (2 * getRadius()  
         + getCylinderHeight());
      return surfaceArea;
   }
   /** method gets the volume.
    *@return -volume
    */
   public double volume() {
      double volume = Math.PI * Math.pow(radius, 2) * ((4.0 / 3.0) 
         * getRadius() + getCylinderHeight());
      return volume; 
   }
   /** Method of toString.
    *@return -
    */
   public String toString() {
      DecimalFormat fmt1 = new DecimalFormat("#,##0.0##");
      String output = "Spherocylinder \"" + getLabel() 
         + "\" with radius " + fmt1.format(getRadius()) 
         + " and cylinder height " 
         + fmt1.format(getCylinderHeight()) + " has:"
         + "\n\tcircumference = " + fmt1.format(circumference()) + " units" 
         + "\n\tsurface area = " + fmt1.format(surfaceArea()) + " square units"
         + "\n\tvolume = " + fmt1.format(volume()) + " cubic units";
      return output;
   }
   /** Gets the count.
    *@return -
    */
   public static int getCount() {
      return count;
   }
   /** Resets the count.
    *
    */
   public static void resetCount() {
      count = 0;
   }
   /**Equals method. 
    *@param obj -not used
    @@return -
    */
   public boolean equals(Object obj) {
      if (!(obj instanceof Spherocylinder)) {
         return false;
      }
      else {
         Spherocylinder d = (Spherocylinder) obj;
         return (label.equalsIgnoreCase(d.getLabel())
                  && Math.abs(radius - d.getRadius()) < .000001
                  && Math.abs(cylinderHeight - d.getCylinderHeight())
                        < .000001);
      }
   }
   /** If Equals method is implemented.
    *@return -
    */
   public int hashCode() {
      return 0;
   }
}