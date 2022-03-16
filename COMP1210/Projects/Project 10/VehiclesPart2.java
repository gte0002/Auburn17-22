import java.io.FileNotFoundException;
/** Main driver for Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 30, 2017
 */
public class VehiclesPart2 {
  /** Main Method.
   *@param args -
   *@throws FileNotFoundException if file cannot open.
   */
   public static void main(String[] args) throws FileNotFoundException {
      UseTaxList taxList = new UseTaxList();
      if (args.length != 0) {
         String fileName = args[0];
         taxList.readVehicleFile(fileName);
      }
      
      System.out.println(taxList.summary() + taxList.listByOwner() 
         + taxList.listByUseTax() + taxList.excludedRecordsList());
   
   }
}