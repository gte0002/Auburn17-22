/**   */
public class Customer implements Comparable<Customer> {
   private String name;
   private String location;
   private double balance;
/** Constructor.
 *@param nameIn -
 */
   public Customer(String nameIn) {
      name = nameIn;
      location = "";
      balance = 0;
   }
 /**
  *@param locationIn -
  */
   public void setLocation(String locationIn) {
      location = locationIn;
   }
 /**
  *@param amount -
  */
   public void changeBalance(double amount) {
      balance += amount;
   }
 /**
  *@return -location
  */
   public String getLocation() {
      return location;
   }
 /**
  *@return -balance
  */
   public double getBalance() {
      return balance;
   }
 /**
  *@param city -
  *@param state -
  */
   public void setLocation(String city, String state) {
      location = city + ", " + state;
   }
 /**
  *@return -
  */
   public String toString() {
      return name + "\n" + location + "\n" + "$" + balance;
   }
 /**
  *@return -
  *@param obj -
  */
   public int compareTo(Customer obj) {
      if (Math.abs(this.balance - obj.getBalance()) < 0.000001) {
         return 0;
      }
      else if (this.balance < obj.getBalance()) {
         return -1;
      }
      else {
         return 1;
      }
   }
}