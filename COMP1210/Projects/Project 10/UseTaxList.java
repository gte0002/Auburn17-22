import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.File;
import java.util.Arrays;
/** Extends Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 29, 2017
 */
public class UseTaxList {
   private String taxDistrict;
   private Vehicle[] vehicleList;
   private String[] excludedRecords;
   /** Constructor.
    *
    */
   public UseTaxList() {
      taxDistrict = "not yet assigned";
      vehicleList = new Vehicle[0];
      excludedRecords = new String[0];
   }
   /** read file method.
    *@param fileNameIn -
    *@throws FileNotFoundException if file cannot open.
    */
   public void readVehicleFile(String fileNameIn) 
                                 throws FileNotFoundException {
   
      Scanner scanFile = new Scanner(new File(fileNameIn));
      taxDistrict = scanFile.nextLine();
      Scanner scanLine;
      while (scanFile.hasNext()) {
         String line = scanFile.nextLine();
         scanLine = new Scanner(line);
         scanLine.useDelimiter(";");
         
         char type = scanLine.next().toUpperCase().charAt(0);
         String owner = scanLine.next().trim();
         String yearMakeModel = scanLine.next().trim();
         double value = Double.parseDouble(scanLine.next().trim());
         boolean altFuel = Boolean.parseBoolean(scanLine.next().trim());
         
         switch (type) {
            case 'C':
            
               Vehicle vehicle = new Car(owner, yearMakeModel, value, altFuel);
               addVehicle(vehicle);
               break;
            
            case 'T':
            
               double tons = Double.parseDouble(scanLine.next().trim());
               Vehicle vehicle2 = new Truck(owner, yearMakeModel, 
                                             value, altFuel, tons);
               addVehicle(vehicle2);
               break;
            
            case 'S':
            
               double tons2 = Double.parseDouble(scanLine.next().trim());
               int axles = Integer.parseInt(scanLine.next().trim());
               Vehicle vehicle3 = new SemiTractorTrailer(owner, yearMakeModel, 
                                             value, altFuel, tons2, axles);
               addVehicle(vehicle3);
               break;
            
            case 'M':
            
               double engSize = Double.parseDouble(scanLine.next().trim());
               Vehicle vehicle4 = new Motorcycle(owner, yearMakeModel, value, 
                                                         altFuel, engSize);
               addVehicle(vehicle4);
               break;
         
            default: 
               addExcludedRecord(line);
               break;
         } 
      }  
   }
   /** Add vehicle Method.
    *@param vehicleIn -
    */
   public void addVehicle(Vehicle vehicleIn) {
      vehicleList = Arrays.copyOf(vehicleList, vehicleList.length + 1);
      vehicleList[vehicleList.length - 1] = vehicleIn;
   }
   /** Add excluded vehicle list.
    *@param vehicleIn -
    */
   public void addExcludedRecord(String vehicleIn) {
      excludedRecords = Arrays.copyOf(excludedRecords, 
                                       excludedRecords.length + 1);
      excludedRecords[excludedRecords.length - 1] = vehicleIn;
   }
   /** get tax district method.
    *@return -
    */
   public String getTaxDistrict() {
      return taxDistrict;
   }
   /** Set tax district method.
    *@param taxDistrictIn -
    */
   public void setTaxDistrict(String taxDistrictIn) {
      taxDistrict = taxDistrictIn;
   }
   /** get vehicle list method.
    *@return -
    */
   public Vehicle[] getVehicleList() {
      return vehicleList;
   }
   /** get excluded records method.
    *@return -
    */
   public String[] getExcludedRecords() {
      return excludedRecords;
   }
   /** to String method.
    *@return -
    */
   public String toString() {
      String output = "";
      int index = 0;
      for (int i = 0; i < vehicleList.length; i++) {
         if (vehicleList[i] != null) {
            output += "\n" + vehicleList[i] + "\n";
         }
         index++;
      }
       
      return output;
   }
   /** use tax total method.
    *@return -
    */
   public double calculateTotalUseTax() {
    
      double total = 0;
      int index = 0;
      for (int i = 0; i < vehicleList.length; i++) {
         if (vehicleList[i] != null) {
            total += vehicleList[i].useTax();
         }
         index++;
      }
      return total;
   }
   /** cal total value method.
    *@return -
    */
   public double calculateTotalValue() {
      double total = 0;
      int index = 0;
      for (int i = 0; i < vehicleList.length; i++) {
         if (vehicleList[i] != null) {
            total += vehicleList[i].getValue();
         }
         index++;
      }
      return total;
   }
   /** summary method.
    *@return -
    */
   public String summary() {
      String output = "";
      output = "\n------------------------------\n"
         + "Summary for " + taxDistrict 
         + "\n------------------------------";
      output += "\nNumber of Vehicles: " + Vehicle.getVehicleCount();
      output += "\nTotal Value: " + calculateTotalValue();
      output += "\nTotal Use Tax: " + calculateTotalUseTax() + "\n";
      return output + "\n";
   }
   /** List by owner Method.
    *@return -
    */
   public String listByOwner() {
      Arrays.sort(vehicleList);
      String output = "\n------------------------------\n"
         + "Vehicles by Owner\n" + "------------------------------\n";
         
      for (Vehicle listItem : vehicleList) {
         output += "\n" + listItem + "\n";
      }
      return output + "\n";
   }
   /** List by use tax Method.
    *@return -
    */
   public String listByUseTax() {
      UseTaxComparator newList = new UseTaxComparator();
      Arrays.sort(vehicleList, newList);
      String output = "\n------------------------------\n"
         + "Vehicles by Use Tax\n" + "------------------------------\n";
         
      for (Vehicle listItem : vehicleList) {
         output += "\n" + listItem + "\n";
      }
      return output + "\n";
   }
   /** excluded list.
    *@return -
    */
   public String excludedRecordsList() {
      String output = "\n------------------------------\n"
         + "Excluded Records\n" + "------------------------------\n";
      for (String listItem : excludedRecords) {
         output += "\n" + listItem + "\n";
      }
      return output;
   }
}