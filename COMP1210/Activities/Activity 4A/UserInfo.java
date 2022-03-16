 /** Program to write classes.
 * Activity 4A
 * @ Gabriel Emerson - Comp 1210 - 001
 * @ September 24, 2017
 */	

public class UserInfo {

    // instance variables
   private String firstName;
   private String lastName;
   private String location;
   private int age;
   private int status;
   private static final int OFFLINE = 0, ONLINE = 1;
    
    // constructor
    /** constructor insert varaibles.
    *@param firstNameIn -not used
    *@param lastNameIn -not used
    */
   public UserInfo(String firstNameIn, String lastNameIn) {
      firstName = firstNameIn;
      lastName = lastNameIn;
      location = "Not specified";
      age = 0;
      status = OFFLINE;
   }
    //methods
    /** method output.
    *@return -output
    */
   public String toString() {
      String output = "Name: " + firstName + " "
          + lastName + "\n";
      output += "Location: " + location + "\n";
      output += "Age: " + age + "\n";
      output += "Status: ";
      if (status == OFFLINE) {
         output += "Offline";
      }
      else {
         output += "Online";
      }
      return output;
   }
   /** Sets location.
   *@param locationIn -not used
   * no return (void)
   */
   public void setLocation(String locationIn) {
      location = locationIn;
   }
    /** Sets boolean for setAge.
    *@return -isSet
    *@param ageIn -not used
    */
   public boolean setAge(int ageIn) {
      boolean isSet = false;
      if (ageIn > 0) {
         age = ageIn;
         isSet = true; 
      }
      return isSet; 	
   }
   /** Gets age.
   *@return -age
   */
   public int getAge() {
      return age;
   }
   /** Gets location.
   * No return needed (void)
   *@return -location
   */
   public String getLocation() {
      return location;
   }
   /** States logOff Offline.
   */
   public void logOff() {
      status = OFFLINE;
   }
   /** States logOn Online.
   */
   public void logOn() {
      status = ONLINE;	   	
   
   }	   	

}

