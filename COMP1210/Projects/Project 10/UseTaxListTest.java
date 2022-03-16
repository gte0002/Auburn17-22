import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import java.io.FileNotFoundException;
 /**  */
public class UseTaxListTest {


  /** Fixture initialization (common initialization
   *  for all tests). **/
   @Before public void setUp() {
   }


  /** Test method to read in file.  
   * @throws FileNotFoundException if file cannot open.
   */
   @Test public void readVehicleFileTest() throws FileNotFoundException {
      Vehicle car1 = new Car("Sams, Joe", "2017 Honda Accura",
                               23000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                               22000, false); 
      Vehicle[] array = new Vehicle[2];
      array[0] = car1;
      array[1] = car2;
      
      UseTaxList tax = new UseTaxList();
      //tax = tax.readVehicleFile("vehicles1.txt");
      Assert.assertEquals("readVehicleFile", "Tax District 52", 
                            tax.getTaxDistrict());
   }
  /** Add Vehicle Test. 
   *
   */
   @Test public void addVehicleTest() {
      Vehicle car1 = new Car("Sams, Joe", "2017 Honda Accura",
                               23000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                               22000, false); 
      Vehicle[] array = new Vehicle[2];
      array[0] = car1;
      array[1] = car2;
      
      UseTaxList tax = new UseTaxList();
      Vehicle car3 = new Car("Janks, Samuel", "2017 Honda Accord",
                               21000, false);
      tax.addVehicle(car3);
      Vehicle[] array2 = tax.getVehicleList();
      Assert.assertEquals("addVehicleTest",
                            car3, array[2]);
   
   
   }
  /** Add excluded record Test.
   *
   */
   @Test public void addExcludedRecord() {
      Vehicle car1 = new Car("Sams, Joe", "2017 Honda Accura",
                               23000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                               22000, false); 
      String test = "Firetruck; Body, Abel; 2015 GMC FE250; 55000; false; 2.5";
      Vehicle[] array = new Vehicle[2];
      array[0] = car1;
      array[1] = car2;
      
      UseTaxList tax = new UseTaxList();
      //Assert.assertEquals("addexcludedRecord", "a", tax.addExcludedRecord(test));
   }
  /**
   *
   */
   @Test public void getTaxDistrict() {
      Vehicle car1 = new Car("Sams, Joe", "2017 Honda Accura",
                               23000, false);
      Vehicle car2 = new Car("Jones, Sam", "2017 Honda Accord",
                               22000, false); 
      Vehicle[] array = new Vehicle[2];
      array[0] = car1;
      array[1] = car2;
      
      UseTaxList tax = new UseTaxList();
      Assert.assertEquals("getTaxDistrictTest", "not yet assigned", 
                                              tax.getTaxDistrict());
   }
  /**
   *
   */
   @Test public void setTaxDistrictTest() {
      Vehicle car1 = new Car("Sams, Joe", "2017 Honda Accura",
                               23000, false);
      //Assert.assertFalse("setTaxDistrictTest1", car1.setTaxDistrict(null));
    
   }
  /**
   *
   */
   @Test public void getVehicleListTest() {
    
   }
  /**
   *
   */
   @Test public void getExcludedRecords() {
    
   }
  /**
   *
   */
   @Test public void toStringTest() {
    
   }
  /**
   *
   */
   @Test public void calculateTotalUseTax() {
    
   }
  /**
   *
   */
   @Test public void calculateTotalValue() {
    
   }
  /**
   *
   */
   @Test public void summaryTest() {
    
   }
  /**
   *
   */
   @Test public void listByOwnerTest() {
    
   }
  /**
   *
   */
   @Test public void listByUseTax() {
    
   }
  /**
   *
   */
   @Test public void excludedRecordsList() {
    
   }
}
